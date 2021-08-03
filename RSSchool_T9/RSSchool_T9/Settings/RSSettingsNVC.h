//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>
#import "RSColorDelegate.h"
#import "RSStoryDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface RSSettingsNVC : UIViewController <UITableViewDelegate, UITableViewDataSource, RSColorDelegate>
@property (weak) id <RSStoryDelegate> delegateSwift;
@end

NS_ASSUME_NONNULL_END
