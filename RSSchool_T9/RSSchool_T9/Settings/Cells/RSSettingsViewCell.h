//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSSettingsViewCell : UITableViewCell
@property (nonatomic, strong) UIView *content;
@property (nonatomic) NSInteger numb;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UILabel *drawLabel;
@property (nonatomic, strong) UILabel *strokeLabel;
@property (nonatomic, strong) UILabel *colorSubLabel;
@property (nonatomic, strong) UISwitch *switcher;
@property (nonatomic, strong) NSString *str;
@property (nonatomic, strong) UIColor *color;
@end

NS_ASSUME_NONNULL_END
