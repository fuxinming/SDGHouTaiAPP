//
//  LoginViewController.h
//  FMBaseProject
//
//  Created by shanjin on 2016/11/5.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import "FMFormViewController.h"

@interface LoginViewController : FMFormViewController
@property (nonatomic,copy)void (^loginSucc)(NSString *token,NSString *scope);
@end
