//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 03.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "RSColorsVC.h"
#import "RSColorCell.h"
#import "UIColor+RSColors.h"

@interface RSColorsVC ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic) NSInteger selectedSell;
@end

@implementation RSColorsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 10, 100, 100) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self addConstraintsToTableView];
    self.selectedSell = 6;
}

- (void)addConstraintsToTableView {
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.tableView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RSColorCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"RSColorCell"];
    if (cell == nil)
    {
        cell = [[RSColorCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"RSColorCell"];
    }
    cell.numb = indexPath.row;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont fontWithName:@"SFProDisplay-Regular" size:17];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineHeightMultiple = 1.08;
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"#f3af22" attributes: @{
        NSParagraphStyleAttributeName: paragraphStyle}];
    cell.textLabel.textColor = [UIColor putColor:@(indexPath.row)];
    string = [UIColor putName:@(indexPath.row)];
    cell.textLabel.text = string.copy;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 13;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedSell = indexPath.row;
    UIColor *colorToPass = [UIColor putColor:@(self.selectedSell)];
    NSString *str = [UIColor putName:@(self.selectedSell)];
    [self.delegate passColor:colorToPass andTheName:str];
    [self.delegate passSelectedNumber:@(self.selectedSell)];
    [self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 51;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.selectedSell inSection:0];
    [self.tableView selectRowAtIndexPath:path animated:NO scrollPosition:UITableViewScrollPositionNone];
}

@end
