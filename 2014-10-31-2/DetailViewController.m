//
//  DetailViewController.m
//  2014-10-31-2
//
//  Created by TTC on 10/31/14.
//  Copyright (c) 2014 TTC. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *numberTextField;
@property (nonatomic, strong) UIButton *button;

@end


@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(60, 100, 200, 40)];
    self.nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.nameTextField.placeholder = @"姓名";
    self.nameTextField.text = _name;
    [self.view addSubview:self.nameTextField];
    
    self.numberTextField = [[UITextField alloc] initWithFrame:CGRectMake(60, 150, 200, 40)];
    self.numberTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.numberTextField.placeholder = @"电话";
    self.numberTextField.text = _number;
    [self.view addSubview:self.numberTextField];
    
    self.button =[UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(110, 200, 80, 30);
    self.button.backgroundColor = [UIColor grayColor];
    [self.button setTitle:@"确定" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(selectOKAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)selectOKAction:(id)sender {
    if ([self.nameTextField.text isEqualToString:@""] || [self.numberTextField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"姓名或号码不能为空"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    ContactData *data = [[ContactData alloc] init];
    data.name = self.nameTextField.text;
    data.number = self.numberTextField.text;
    [self.delegate passValue:data];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
