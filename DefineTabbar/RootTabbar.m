//
//  RootTabbar.m
//  NSNoticeCenter
//
//  Created by 叶永长 on 8/5/15.
//  Copyright (c) 2015 YYC. All rights reserved.
//

#import "RootTabbar.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface RootTabbar ()
{
    NSArray *buttonImageArray;
    NSArray *buttonClickArray;
}
@end

@implementation RootTabbar

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatTabbarButton];
    
    NSMutableArray *tabbarElementArray = [[NSMutableArray alloc]init];
    
    FirstViewController *first = [[FirstViewController alloc]init];
    UINavigationController *firstNavi = [[UINavigationController alloc]initWithRootViewController:first];
    
    SecondViewController *second = [[SecondViewController alloc]init];
    UINavigationController *secondNavi = [[UINavigationController alloc]initWithRootViewController:second];
    
    ThirdViewController *third = [[ThirdViewController alloc]init];
    UINavigationController *thirdNavi = [[UINavigationController alloc]initWithRootViewController:third];
    
    [tabbarElementArray addObject:firstNavi];
    [tabbarElementArray addObject:secondNavi];
    [tabbarElementArray addObject:thirdNavi];
    
    self.viewControllers = tabbarElementArray;
    
    
}
-(void)creatTabbarButton{
    self.NewTabbar = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-49, [UIScreen mainScreen].bounds.size.width, 49)];
    self.NewTabbar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.NewTabbar];
    
    _buttonArray = @[@"fa-reply",@"fa-road",@"fa-rss"];
    //    buttonImageArray = @[@"chat",@"find",@"myself"];
    //    buttonClickArray = @[@"chatClick",@"findClick",@"peopleClick"];
    buttonImageArray = @[@"chat",@"find",@"me"];
    buttonClickArray = @[@"chatclicked",@"findcilcked",@"meclicked"];
    for (int i = 0; i<3; i++) {
        self.tabbarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.tabbarButton.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width/3-5)*i+20, 0, 72, 50);
        
        [_tabbarButton setImage:[UIImage imageNamed:buttonImageArray[i]] forState:UIControlStateNormal];
        [_tabbarButton setImage:[UIImage imageNamed:buttonClickArray[i]] forState:UIControlStateSelected];
        [_tabbarButton addTarget:self action:@selector(ChangeViewController:) forControlEvents:UIControlEventTouchUpInside];
        _tabbarButton.tag = 100+i;
        [_NewTabbar addSubview:_tabbarButton];
        _tabbarLabel = [[UILabel alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width/3-5)*i, 5, [UIScreen mainScreen].bounds.size.width/3, 15)];
        _tabbarLabel.tag = 200+i;
        _tabbarLabel.text = _buttonArray[i];
        _tabbarLabel.textColor = [UIColor blackColor];
        _tabbarLabel.font = [UIFont systemFontOfSize:12];
        _tabbarLabel.textAlignment = NSTextAlignmentCenter;
        
        [_NewTabbar addSubview:_tabbarLabel];//tabbar图标下面的文字，注释
    }
    UIButton *button = (UIButton *)[_NewTabbar viewWithTag:100];
    button.selected = YES;
    UILabel *selectLabel = (UILabel *)[_NewTabbar viewWithTag:200];
    selectLabel.textColor  =[UIColor redColor];
}
-(void)ChangeViewController:(UIButton *)button{
    self.selectedIndex = button.tag-100;
    button.selected = YES;
    
    self.hidesBottomBarWhenPushed = YES;
    //遍历tabBar 上面的所有button
    for (UIView *newBtn in _NewTabbar.subviews) {
        if ([newBtn isKindOfClass:[UIButton class]]) {//判断是否是UIButton的实例对象
            if (newBtn.tag == button.tag) {//如果是被点击的按钮
                //设置为选中状态
                [(UIButton *)newBtn setSelected:YES];
            }else{
                //取消选中
                [(UIButton *)newBtn setSelected:NO];
            }
            
        }else if ([newBtn isKindOfClass:[UILabel class]]){
            if (newBtn.tag == button.tag+100) {
                ((UILabel *)newBtn).textColor = [UIColor redColor];
            }else{
                ((UILabel *)newBtn).textColor = [UIColor blackColor];
            }
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
