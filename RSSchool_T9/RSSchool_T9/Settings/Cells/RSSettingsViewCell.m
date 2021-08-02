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
    self.selectedBackgroundView.backgroundColor = UIColor.clearColor;
    self.content = [UIView new];
    self.content.backgroundColor = UIColor.whiteColor;
    self.content.layer.backgroundColor = UIColor.whiteColor.CGColor;
    self.content.layer.cornerRadius = 16;
    self.line = [UIView new];
    self.line.backgroundColor = self.superview.backgroundColor;
    [self addConstraintsToCells];
    
    if (self.numb == 0)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (self.numb == 1 && self.selected)
    {
        for (UIView *v in self.contentView.subviews)
        {
            self.contentView.backgroundColor = UIColor.clearColor;
            v.backgroundColor = UIColor.lightGrayColor;
        }
    }
    [super layoutSubviews];
}

- (void)addConstraintsToCells {
    [self.contentView addSubview:self.content];
    self.content.translatesAutoresizingMaskIntoConstraints = NO;
    if (self.numb == 0)
    {
        self.selectedBackgroundView.backgroundColor = UIColor.clearColor;
        [self.content.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
        [self.content.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
        [self.content.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-(self.frame.size.height / 4)].active = YES;
        [self.content.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
        UIView *rect = [UIView new];
        [self.contentView addSubview:rect];
        rect.translatesAutoresizingMaskIntoConstraints = NO;
        rect.backgroundColor = UIColor.whiteColor;
        [rect.topAnchor constraintEqualToAnchor:self.content.bottomAnchor constant:-(self.frame.size.height / 2)].active = YES;
        [rect.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
        [rect.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
        [rect.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
        [self.contentView addSubview:self.line];
        self.line.translatesAutoresizingMaskIntoConstraints = NO;
        [self.line.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
        [self.line.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:self.separatorInset.left].active = YES;
        [self.line.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
        [self.line.heightAnchor constraintEqualToConstant:2].active = YES;
        [self addDrawStoryLabel];
        [self addSwitcher];
    }
    if (self.numb == 1)
    {
        UIView *rect = [UIView new];
        [self.contentView addSubview:rect];
        rect.translatesAutoresizingMaskIntoConstraints = NO;
        rect.backgroundColor = UIColor.whiteColor;
        [rect.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
        [rect.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
        [rect.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-(self.frame.size.height / 2)].active = YES;
        [rect.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
        self.selectedBackgroundView.backgroundColor = UIColor.clearColor;
        [self.content.topAnchor constraintEqualToAnchor:self.topAnchor constant:self.frame.size.height / 4].active = YES;
        [self.content.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
        [self.content.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
        [self.content.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
        [self addStrokeColorLabel];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
}

- (void)addDrawStoryLabel {
    self.drawLabel = [UILabel new];
    self.drawLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    self.drawLabel.font = [UIFont fontWithName:@"SFProDisplay-Regular" size:17];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineHeightMultiple = 1.08;
    self.drawLabel.textAlignment = NSTextAlignmentCenter;
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"Draw stories" attributes: @{ NSParagraphStyleAttributeName:paragraphStyle}];
    self.drawLabel.attributedText = string;
    [self.contentView addSubview:self.drawLabel];
    self.drawLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.drawLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    [self.drawLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:self.separatorInset.left].active = YES;
    [self.drawLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    [self.drawLabel.heightAnchor constraintEqualToAnchor:self.heightAnchor].active = YES;
}

- (void)addStrokeColorLabel {
    self.strokeLabel = [UILabel new];
    self.strokeLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    self.strokeLabel.font = [UIFont fontWithName:@"SFProDisplay-Regular" size:17];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineHeightMultiple = 1.08;
    self.strokeLabel.textAlignment = NSTextAlignmentCenter;
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"Stroke color" attributes: @{ NSParagraphStyleAttributeName:paragraphStyle}];
    self.strokeLabel.attributedText = string;
    [self.contentView addSubview:self.strokeLabel];
    self.strokeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.strokeLabel.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.strokeLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:self.separatorInset.left].active = YES;
    [self.strokeLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    [self.strokeLabel.heightAnchor constraintEqualToConstant:self.frame.size.height / 1.5].active = YES;
    [self addStrokeColor];
}

- (void)addStrokeColor {
    self.colorSubLabel = [UILabel new];
    self.colorSubLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    self.colorSubLabel.font = [UIFont fontWithName:@"SFProDisplay-Regular" size:12];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineHeightMultiple = 1.12;
    self.colorSubLabel.textAlignment = NSTextAlignmentCenter;
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"#e87aa4" attributes: @{ NSParagraphStyleAttributeName:paragraphStyle}];
    self.colorSubLabel.attributedText = string;
    [self.strokeLabel addSubview:self.colorSubLabel];
    self.colorSubLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.colorSubLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-5].active = YES;
    [self.colorSubLabel.leadingAnchor constraintEqualToAnchor:self.strokeLabel.leadingAnchor].active = YES;
    [self.colorSubLabel.trailingAnchor constraintEqualToAnchor:self.strokeLabel.trailingAnchor].active = YES;
    [self.colorSubLabel.heightAnchor constraintEqualToConstant:self.frame.size.height / 2.5].active = YES;
    [self.colorSubLabel sizeToFit];
}

- (void)addSwitcher {
    self.switcher = [UISwitch new];
    [self.contentView addSubview:self.switcher];
    self.switcher.translatesAutoresizingMaskIntoConstraints = NO;
    [self.switcher.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-self.separatorInset.left].active = YES;
    [self.switcher.widthAnchor constraintEqualToConstant:self.frame.size.height].active = YES;
    [self.switcher.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
}

@end
