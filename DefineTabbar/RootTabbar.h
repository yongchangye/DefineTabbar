//
//  RootTabbar.h
//  NSNoticeCenter
//
//  Created by 叶永长 on 8/5/15.
//  Copyright (c) 2015 YYC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootTabbar : UITabBarController
@property (nonatomic,strong)UIView *NewTabbar;
@property (nonatomic,strong)NSArray *buttonArray;
@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)UIButton *tabbarButton;
@property (nonatomic,strong)UILabel *tabbarLabel ;
@property (nonatomic,strong)UIView *messageNumView;
@property (nonatomic, strong)UILabel *messageNumberLabel;
@end
