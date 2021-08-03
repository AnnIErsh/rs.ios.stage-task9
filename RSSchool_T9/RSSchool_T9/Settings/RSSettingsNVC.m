//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "RSSettingsNVC.h"
#import "RSSettingsViewCell.h"
#import "RSColorsVC.h"

@interface RSSettingsNVC ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RSColorsVC *vc;
@property (nonatomic, strong) NSString *colorName;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic) NSInteger selectedSell;

@end

@implementation RSSettingsNVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.vc = [[RSColorsVC alloc] init];
    self.navigationController.navigationBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 88);
    self.navigationItem.backBarButtonItem.tintColor = UIColor.redColor;
    self.title = @"Settings";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 10, 100, 100) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorColor = self.tableView.backgroundColor;
    [self.view addSubview:self.tableView];
    [self makeTitleItem];
    [self addConstraintsToTableView];
    self.colorName =  @"#f3af22";
    self.selectedSell = 6;
    self.color = [UIColor colorWithRed:0.953 green:0.686 blue:0.133 alpha:1];
}

- (void)addConstraintsToTableView {
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.tableView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
}

- (void)makeTitleItem {
    UILabel *middleItem = [UILabel new];
    middleItem.frame = CGRectMake(0, 0, 63, 22);
    middleItem.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    middleItem.font = [UIFont fontWithName:@"SFProDisplay-Semibold" size:17];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineHeightMultiple = 1.08;
    middleItem.textAlignment = NSTextAlignmentCenter;
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"Settings" attributes: @{
        NSParagraphStyleAttributeName: paragraphStyle}];
    middleItem.attributedText = string;
    self.navigationItem.titleView = middleItem;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RSSettingsViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"RSSettingsViewCell"];
    if (cell == nil)
    {
        cell = [[RSSettingsViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"RSSettingsViewCell"];
    }
    cell.numb = indexPath.row;
    cell.str = self.colorName;
    cell.color = self.color;
    cell.selectedBackgroundView.backgroundColor = self.tableView.backgroundColor;
    cell.backgroundColor = self.tableView.backgroundColor;
    cell.inputView.backgroundColor = self.tableView.backgroundColor;
    cell.layer.backgroundColor = self.tableView.backgroundColor.CGColor;
    cell.inputView.layer.backgroundColor = self.tableView.backgroundColor.CGColor;
    cell.selectedBackgroundView.layer.backgroundColor = self.tableView.backgroundColor.CGColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1)
    {
        self.vc.delegate = self;
        [self.navigationController pushViewController:self.vc animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 51;
}

- (void)passColor:(UIColor *)theValue andTheName:(nonnull NSString *)name {
    self.colorName = name;
    self.color = theValue;
}

- (void)passSelectedNumber:(NSNumber *)numb {
    self.selectedSell = numb.intValue;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSIndexPath *path = [NSIndexPath indexPathForRow:1 inSection:0];
    RSSettingsViewCell *cell = [self.tableView cellForRowAtIndexPath:path];
    cell.str = self.colorName;
    cell.color = self.color;
    cell.colorSubLabel.text = self.colorName;
    cell.colorSubLabel.textColor = self.color;
}

@end
