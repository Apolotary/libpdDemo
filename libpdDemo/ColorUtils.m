//
//  ColorUtils.m
//  libpdDemo
//
//  Created by Bektur Ryskeldiev on 2/11/15.
//  Copyright (c) 2015 Bektur Ryskeldiev. All rights reserved.
//

#import "ColorUtils.h"

@implementation ColorUtils

+ (UIColor *)getColorForNoiseLevel:(CGFloat)noiseLevel
{
    if (noiseLevel >= 0 && noiseLevel < 10)
    {
        return [UIColor colorWithRed:56/255.0f green:234/255.0f blue:231/255.0f alpha:1.0];
    }
    else if (noiseLevel >= 10 && noiseLevel < 20)
    {
        return [UIColor colorWithRed:59/255.0f green:236/255.0f blue:148/255.0f alpha:1.0];
    }
    else if (noiseLevel >= 20 && noiseLevel < 30)
    {
        return [UIColor colorWithRed:60/255.0f green:238/255.0f blue:76/255.0f alpha:1.0];
    }
    else if (noiseLevel >= 30 && noiseLevel < 40)
    {
        return [UIColor colorWithRed:61/255.0f green:239/255.0f blue:6/255.0f alpha:1.0];
    }
    else if (noiseLevel >= 40 && noiseLevel < 50)
    {
        return [UIColor colorWithRed:104/255.0f green:237/255.0f blue:10/255.0f alpha:1.0];
    }
    else if (noiseLevel >= 50 && noiseLevel < 60)
    {
        return [UIColor colorWithRed:176/255.0f green:236/255.0f blue:9/255.0f alpha:1.0];
    }
    else if (noiseLevel >= 60 && noiseLevel < 70)
    {
        return [UIColor colorWithRed:230/255.0f green:205/255.0f blue:11/255.0f alpha:1.0];
    }
    else if (noiseLevel >= 70 && noiseLevel < 80)
    {
        return [UIColor colorWithRed:230/255.0f green:122/255.0f blue:9/255.0f alpha:1.0];
    }
    else if (noiseLevel >= 80 && noiseLevel < 90)
    {
        return [UIColor colorWithRed:228/255.0f green:48/255.0f blue:10/255.0f alpha:1.0];
    }
    return [UIColor colorWithRed:235/255.0f green:0/255.0f blue:17/255.0f alpha:1.0];
}

@end
