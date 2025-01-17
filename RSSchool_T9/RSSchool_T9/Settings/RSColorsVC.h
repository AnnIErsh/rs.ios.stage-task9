//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 03.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>
#import "RSColorDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface RSColorsVC : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak) id <RSColorDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
