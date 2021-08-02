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
    
    if (UIScreen.mainScreen.bounds.size.width > UIScreen.mainScreen.bounds.size.height)
    {
        w = UIScreen.mainScreen.bounds.size.height / 2.2 * 3.8;
    }
    frame.origin.x += w;
    frame.size.width -= (2 * w);
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)layoutSubviews {
    self.backgroundColor = UIColor.clearColor;
    self.contentView.backgroundColor = UIColor.clearColor;
    self.content = [UIView new];
    self.content.layer.backgroundColor = UIColor.whiteColor.CGColor;
    self.content.layer.cornerRadius = 16;
    self.line = [UIView new];
    self.line.backgroundColor = self.superview.backgroundColor;
    [self addConstraintsToCells];
    [super layoutSubviews];
}

- (void)addConstraintsToCells {
    [self.contentView addSubview:self.content];
    self.content.translatesAutoresizingMaskIntoConstraints = NO;
    if (self.numb == 0)
    {
        [self.content.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
        [self.content.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
        [self.content.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:(self.frame.size.height / 2)].active = YES;
        [self.content.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
        
        [self.contentView addSubview:self.line];
        self.line.translatesAutoresizingMaskIntoConstraints = false;
        [self.line.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
        [self.line.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:self.separatorInset.left].active = YES;
        [self.line.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
        [self.line.heightAnchor constraintEqualToConstant:2].active = YES;
    }
    if (self.numb == 1)
    {
        [self.content.topAnchor constraintEqualToAnchor:self.topAnchor constant: -(self.frame.size.height / 2)].active = YES;
        [self.content.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
        [self.content.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
        [self.content.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    }
}

@end
