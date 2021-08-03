//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 03.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RSStoryDelegate <NSObject>
- (void)passColor:(UIColor*)theValue;
@optional
- (void)passSwitcherState:(BOOL)state;
@end

NS_ASSUME_NONNULL_END
