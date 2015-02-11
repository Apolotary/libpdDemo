//
//  ViewController.m
//  libpdDemo
//
//  Created by Bektur Ryskeldiev on 2/11/15.
//  Copyright (c) 2015 Bektur Ryskeldiev. All rights reserved.
//

#import "ViewController.h"
#import "PdModel.h"
#import "ColorUtils.h"

@interface ViewController ()
{
    IBOutlet UILabel *_noiseLabel;
    IBOutlet UILabel *_percentLabel;
    CGFloat _noiseLevel;
}

- (void)panRecognized:(UIPanGestureRecognizer *)panGesture;
- (void)updateLabels;

@end

@implementation ViewController

#pragma mark - Updating labels

- (void)updateLabels
{
    UIColor *labelColor = [ColorUtils getColorForNoiseLevel:_noiseLevel];
    
    [_noiseLabel setTextColor:labelColor];
    [_percentLabel setText:[NSString stringWithFormat:@"%1.0f%%", _noiseLevel]];
    [_percentLabel setTextColor:labelColor];
}

#pragma mark - Handling pan gesture

- (void)panRecognized:(UIPanGestureRecognizer *)panGesture
{
    if (panGesture.state == UIGestureRecognizerStateChanged)
    {
        CGPoint velocity = [panGesture velocityInView:self.view];
        
        if (velocity.y < 0 && _noiseLevel <= 99.0)
        {
            _noiseLevel += 1.0;
        }
        else if (velocity.y > 0 && _noiseLevel >= 1.0)
        {
            _noiseLevel -= 1.0;
        }
        
        [[PdModel sharedInstance] setNoiseLevel:_noiseLevel/100.0];
        [self updateLabels];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panRecognized:)];
    [self.view addGestureRecognizer:panGesture];
    
    _noiseLevel = 0.0;
}


@end
