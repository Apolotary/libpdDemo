//
//  PdModel.m
//  libpdDemo
//
//  Created by Bektur Ryskeldiev on 2/11/15.
//  Copyright (c) 2015 Bektur Ryskeldiev. All rights reserved.
//

#import "PdModel.h"
#import "PdAudioController.h"
#import "PdBase.h"

extern void pink_tilde_setup(void);

@interface PdModel () <PdReceiverDelegate>
{
    PdAudioController *_pdAudioController;
}

- (instancetype) init;

@end

@implementation PdModel

#pragma mark - Singletone & init

+ (instancetype)sharedInstance {
    static PdModel *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[PdModel alloc] init];
    });
    
    return _sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [PdBase initialize];
        [PdBase setDelegate:self];
        [PdBase computeAudio:YES];
        
        _pdAudioController = [[PdAudioController alloc] init];
        [_pdAudioController configurePlaybackWithSampleRate:44100
                                             numberChannels:2
                                               inputEnabled:YES
                                              mixingEnabled:NO];
        
        pink_tilde_setup();
    }
    return self;
}

#pragma mark - Opening and working with patch

- (void)openPatch:(NSString *)patchName
         withPath:(NSString *)patchPath
{
    [PdBase openFile:patchName path:patchPath];
    [_pdAudioController setActive:YES];
}

- (void)setNoiseLevel:(float)noiseLevel
{
    [PdBase sendFloat:noiseLevel toReceiver:@"noise_level"];
}

#pragma mark - PdReceiverDelegate

- (void)receivePrint:(NSString *)message
{
    NSLog(@"Pd: %@", message);
}


@end
