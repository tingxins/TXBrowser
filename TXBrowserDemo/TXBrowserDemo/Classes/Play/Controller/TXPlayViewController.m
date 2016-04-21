//
//  TXPlayViewController.m
//  TXBrowserDemo
//
//  Created by tingxins on 3/11/16.
//  Copyright © 2016 TBZ. All rights reserved.
//

#import "TXPlayViewController.h"

#import "TXSystemMusicModel.h"
#import "TXCommandModel.h"

@implementation TXPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBasicViewInfos];
    
//    [self setupDataSource];
    
    [self setupSomeSubviews];
    
    [self analysisDatasourcePlist];
}

- (void)setupBasicViewInfos {
    self.title = @"浏览";
}

- (void)analysisDatasourcePlist {
    NSArray *datasoucePlist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"music.plist" ofType:nil]];
    TXLog(@"datasoucePlist:%@",datasoucePlist);
    /** 此处不做暂时重构 **/
    for (int index = 0; index < datasoucePlist.count; ++ index) {
        NSDictionary *dictionary = datasoucePlist[index];
        NSString *groupName = dictionary[@"groupName"];
        if ([groupName isEqualToString:@"一人嗨"]) {
            TXLog(@"一人嗨");
            /** 1.第一个分组 **/
            NSMutableArray *itemArrows = [NSMutableArray array];
            for (NSDictionary *groupDict in dictionary[@"groupMembers"]) {
                NSMutableArray *childArrows = [NSMutableArray array];
                NSString *demo0Name = groupDict[@"itemName"];
                NSArray  *items     = groupDict[@"items"];
                for (NSDictionary *item in items) {
                    /** 设置内置语音指令模型 **/
                    TXSystemMusicModel *systemModel = [self getSystemMusicModelWithItemDict:item];
                    TXArrowItemModel *arrowItemModel = [TXArrowItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:systemModel.musicName operation:^{
                        /** 点击子cell操作 **/
                        TXCommandModel *commandModel = systemModel.commandModel;
                        TXLog(@"itemModel:%@, fCommand:%d, sCommand:%d", systemModel.musicName, commandModel.fCommand, commandModel.sCommand);
                    }];
                    [childArrows addObject: arrowItemModel];
                }
                
                TXArrowImageItemModel *demo0 = [TXArrowImageItemModel arrowImageItemModelWithClassType:[TXArrowImageItemCell class] title:demo0Name imageName:@"egg" operation:^{
                    /** 点击父cell操作 **/
                    
                    TXItemGroupModel *group0 = [TXItemGroupModel itemGroupModelWithGroupHeaderTitle:@"" groupFooterTitle:@"" groupMembers:childArrows];
                    [self pushDetailViewControllerWithTitle:demo0Name detailSources:[NSMutableArray arrayWithObject:group0]];
                }];
                demo0.customAccessoryImageName = @"arrow_right";
                demo0.customAccessoryText = [NSString stringWithFormat:@"%zd", items.count];
                [itemArrows addObject:demo0];
            }
            
            TXItemGroupModel *group0 = [TXItemGroupModel itemGroupModelWithGroupHeaderTitle:groupName groupFooterTitle:@"" groupMembers:itemArrows];
            [self.dataSource addObject:group0];
        }else {
            /** 2.第二个分组 **/
            NSMutableArray *tempArray = [NSMutableArray array];
            for (NSDictionary *groupDict in dictionary[@"groupMembers"]) {
                TXSystemMusicModel *systemModel = [self getSystemMusicModelWithItemDict:groupDict];
                TXBasicItemModel *itemModel= [TXBasicItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:systemModel.musicName operation:^{
                    /** 点击子cell操作 **/
                    TXCommandModel *commandModel = systemModel.commandModel;
                    TXLog(@"itemModel:%@, fCommand:%d, sCommand:%d", systemModel.musicName, commandModel.fCommand, commandModel.sCommand);
                    
                }];
                [tempArray addObject:itemModel];
            }
            
            TXBasicCollectionItemModel *collectionItemModel = [TXBasicCollectionItemModel basicCollectionItemModelWithClassType:[TXBasicCollectionItemCell class] title:@"" items:tempArray operation:nil];
            collectionItemModel.collectionCellH = TXBasicCollectionViewWH;
            TXItemGroupModel *group1 = [TXItemGroupModel itemGroupModelWithGroupHeaderTitle:groupName groupFooterTitle:@"" groupMembers:@[collectionItemModel]];
            [self.dataSource addObject:group1];
            TXLog(@"groupName:%@", groupName);
        }
    }
}

- (TXSystemMusicModel *)getSystemMusicModelWithItemDict:(NSDictionary *)item {
    NSDictionary *musicCommandDict = item[@"musicCommand"];
    TXCommandModel *commandModel = [TXCommandModel commandModelWithFCommand:[musicCommandDict[@"fCommand"] intValue] sCommand:[musicCommandDict[@"sCommand"] intValue]];
    TXSystemMusicModel *systemModel = [TXSystemMusicModel systemMusicModelWithName:item[@"musicName"] commandModel:commandModel];
    return systemModel;
}

- (void)setupDataSource {
    
    /** 1.第一个分组 **/
    NSString *demo0Name = @"生日祝福";
    TXArrowImageItemModel *demo0 = [TXArrowImageItemModel arrowImageItemModelWithClassType:[TXArrowImageItemCell class] title:demo0Name imageName:@"egg" operation:^{
        /** 点击父cell操作 **/
        TXArrowItemModel *birthMusicItemModel_Chinese = [TXArrowItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"生日快乐歌（中文）" operation:^{
            /** 点击子cell操作 **/
            
        }];
        TXArrowItemModel *birthMusicItemModel_English = [TXArrowItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"生日快乐歌（英文）" operation:^{
            /** 点击子cell操作 **/
            
        }];
        
        TXItemGroupModel *group0 = [TXItemGroupModel itemGroupModelWithGroupHeaderTitle:@"" groupFooterTitle:@"" groupMembers:@[birthMusicItemModel_Chinese, birthMusicItemModel_English]];
        [self pushDetailViewControllerWithTitle:demo0Name detailSources:[NSMutableArray arrayWithObject:group0]];
    }];
    demo0.customAccessoryImageName = @"arrow_right";
    demo0.customAccessoryText = @"2";
    
    NSString *demo1Name = @"节日祝福";
    TXArrowImageItemModel *demo1 = [TXArrowImageItemModel arrowImageItemModelWithClassType:[TXArrowImageItemCell class] title:demo1Name imageName:@"egg" operation:^{
        /** 点击操作 **/
        [self pushDetailViewControllerWithTitle:demo1Name detailSources:nil];
    }];
    demo1.customAccessoryImageName = @"arrow_right";
    demo1.customAccessoryText = @"0";
    
    TXArrowImageItemModel *demo2 = [TXArrowImageItemModel arrowImageItemModelWithClassType:[TXArrowImageItemCell class] title:@"表白" imageName:@"egg" operation:^{
        /** 点击操作 **/
        [self pushDetailViewControllerWithTitle:demo1Name detailSources:nil];
    }];
    demo2.customAccessoryImageName = @"arrow_right";
    demo2.customAccessoryText = @"0";
    
    TXItemGroupModel *group0 = [TXItemGroupModel itemGroupModelWithGroupHeaderTitle:@"一个人嗨" groupFooterTitle:@"" groupMembers:@[demo0, demo1, demo2]];
    
    /** 2.第二个分组 **/
    TXBasicItemModel *itemModel_Double0 = [TXBasicItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"小夫妻" operation:^{
        /** 点击子cell操作 **/
        TXLog(@"itemModel_Double0");
        
    }];
    TXBasicItemModel *itemModel_Double1 = [TXBasicItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"新闻联播" operation:^{
        /** 点击子cell操作 **/
        TXLog(@"itemModel_Double1");
        
    }];
    TXBasicItemModel *itemModel_Double2 = [TXBasicItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"闺中密友" operation:^{
        /** 点击子cell操作 **/
        TXLog(@"itemModel_Double2");
        
    }];
    TXBasicItemModel *itemModel_Double3 = [TXBasicItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"真是醉了" operation:^{
        /** 点击子cell操作 **/
        TXLog(@"itemModel_Double3");
        
    }];
    TXBasicCollectionItemModel *collectionItemModel_Double = [TXBasicCollectionItemModel basicCollectionItemModelWithClassType:[TXBasicCollectionItemCell class] title:@"" items:[NSMutableArray arrayWithObjects:itemModel_Double0, itemModel_Double1, itemModel_Double2, itemModel_Double3, nil] operation:nil];
    collectionItemModel_Double.collectionCellH = TXBasicCollectionViewWH;
    TXItemGroupModel *group1 = [TXItemGroupModel itemGroupModelWithGroupHeaderTitle:@"成双成对" groupFooterTitle:@"" groupMembers:@[collectionItemModel_Double]];
    
    /** 第三个分组 **/
    TXBasicItemModel *itemModel_Triple0 = [TXBasicItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"西游记" operation:^{
        /** 点击子cell操作 **/
        TXLog(@"itemModel_Triple0");
        
    }];
    TXBasicItemModel *itemModel_Triple1 = [TXBasicItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"刘张关" operation:^{
        /** 点击子cell操作 **/
        TXLog(@"itemModel_Triple1");
        
    }];
    TXBasicItemModel *itemModel_Triple2 = [TXBasicItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"三个火枪手" operation:^{
        /** 点击子cell操作 **/
        TXLog(@"itemModel_Triple2");
        
    }];
    TXBasicItemModel *itemModel_Triple3 = [TXBasicItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"真是醉了" operation:^{
        /** 点击子cell操作 **/
        TXLog(@"itemModel_Triple3");
        
    }];
    TXBasicCollectionItemModel *collectionItemModel_Triple = [TXBasicCollectionItemModel basicCollectionItemModelWithClassType:[TXBasicCollectionItemCell class] title:@"" items:[NSMutableArray arrayWithObjects:itemModel_Triple0, itemModel_Triple1, itemModel_Triple2, itemModel_Triple3, nil] operation:nil];
    collectionItemModel_Double.collectionCellH = 150;
    TXItemGroupModel *group2 = [TXItemGroupModel itemGroupModelWithGroupHeaderTitle:@"三妻四妾" groupFooterTitle:@"" groupMembers:@[collectionItemModel_Triple]];
    [self.dataSource addObject:group0];
    [self.dataSource addObject:group1];
    [self.dataSource addObject:group2];
}

- (void)pushDetailViewControllerWithTitle:(NSString *)title detailSources:(NSMutableArray *)detailSources {
    
}

- (void)setupSomeSubviews {
    
}

@end
