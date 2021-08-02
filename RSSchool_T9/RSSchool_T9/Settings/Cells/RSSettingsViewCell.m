//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "RSSettingsViewCell.h"

@implementation RSSettingsViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setFrame:(CGRect)frame {
    float w = UIScreen.mainScreen.bounds.size.width / 4 * 3.8;
    frame.origin.x += w;
    frame.size.width -= (2 * w);
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
