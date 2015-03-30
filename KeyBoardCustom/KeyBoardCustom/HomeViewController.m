//
//  HomeViewController.m
//  KeyBoardCustom
//
//  Created by 宋志明 on 15-3-30.
//  Copyright (c) 2015年 songzm. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(keyboardWillShow:) name: UIKeyboardWillShowNotification object: nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(keyboardWillHide:) name: UIKeyboardWillHideNotification object: nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)keyboardWillShow:(NSNotification*)aNotification{
    NSDictionary* info = [aNotification userInfo];
    //kbSize即為鍵盤尺寸 (有width, height)
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到鍵盤的高度
    NSLog(@"size==%f",kbSize.height);
    [UIView animateWithDuration:.3 animations:^{
        bottomLayout.constant=kbSize.height;
        [self.view layoutIfNeeded];
    }];
}

-(void)keyboardWillHide:(NSNotification*)aNotification{
    [UIView animateWithDuration:.3 animations:^{
        bottomLayout.constant=0;
        [self.view layoutIfNeeded];
    }];
}

//
- (IBAction)onclickBgButton:(id)sender {
    [self.view endEditing:YES];
    
}



@end
