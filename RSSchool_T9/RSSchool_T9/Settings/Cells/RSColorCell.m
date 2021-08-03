//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 03.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "RSColorCell.h"

@implementation RSColorCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setFrame:(CGRect)frame {
    float w = UIScreen.mainScreen.bounds.size.width / 4 * 3.8;
    
    if (UIScreen.mainScreen.bounds.size.width > UIScreen.mainScreen.bounds.size.height)
    {
        w = UIScreen.mainScreen.bounds.size.height / 2.2 * 3.8;
    }
    frame.origin.x += w;
    frame.size.width -= (2 * w);
    [super setFrame:frame];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected)
    {
        self.accessoryType = UITableViewCellAccessoryCheckmark;
        self.tintColor = UIColor.redColor;
    }
    else
    {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}

@end
