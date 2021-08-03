//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 03.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "UIColor+RSColors.h"

@implementation UIColor (RSColors)
+ (id)putColor:(NSNumber*)t {
    NSArray *colors = @[[self colorWithRed:0.745 green:0.157 blue:0.075 alpha:1],
                        [self colorWithRed:0.22 green:0.008 blue:0.855 alpha:1],
                        [self colorWithRed:0.275 green:0.486 blue:0.141 alpha:1],
                        [self colorWithRed:0.502 green:0.502 blue:0.502 alpha:1],
                        [self colorWithRed:0.557 green:0.353 blue:0.969 alpha:1],
                        [self colorWithRed:0.941 green:0.498 blue:0.353 alpha:1],
                        [self colorWithRed:0.953 green:0.686 blue:0.133 alpha:1],
                        [self colorWithRed:0.239 green:0.675 blue:0.969 alpha:1],
                        [self colorWithRed:0.91 green:0.478 blue:0.643 alpha:1],
                        [self colorWithRed:0.059 green:0.18 blue:0.247 alpha:1],
                        [self colorWithRed:0.129 green:0.216 blue:0.067 alpha:1],
                        [self colorWithRed:0.318 green:0.075 blue:0.027 alpha:1],
                        [self colorWithRed:0.573 green:0 blue:0.231 alpha:1]];
    return colors[t.intValue];
}

+ (id)putName:(NSNumber*)t {
    NSArray *colors = @[@"#be2813",
                        @"#3802da",
                        @"#467c24",
                        @"#808080",
                        @"#8e5af7",
                        @"#f07f5a",
                        @"#f3af22",
                        @"#3dacf7",
                        @"#e87aa4",
                        @"#0f2e3f",
                        @"#213711",
                        @"#511307",
                        @"#92003b"];
    return colors[t.intValue];
}
@end

