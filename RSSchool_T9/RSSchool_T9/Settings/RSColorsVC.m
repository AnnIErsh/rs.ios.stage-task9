//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 03.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "RSColorsVC.h"

@interface RSColorsVC ()

@end

@implementation RSColorsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    self.view.backgroundColor = UIColor.blueColor;
//    NSArray<UIViewController *> *arr = self.navigationController.viewControllers;
//    UIViewController *vc = arr.firstObject;
//    self.navigationController.viewControllers = @[vc, self];
}


@end
