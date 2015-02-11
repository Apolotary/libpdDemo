//
//  PdModel.h
//  libpdDemo
//
//  Created by Bektur Ryskeldiev on 2/11/15.
//  Copyright (c) 2015 Bektur Ryskeldiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PdModel : NSObject

+ (instancetype) sharedInstance;

- (void)openPatch:(NSString *)patchName
         withPath:(NSString *)patchPath;

- (void)setNoiseLevel:(float)noiseLevel;

@end
