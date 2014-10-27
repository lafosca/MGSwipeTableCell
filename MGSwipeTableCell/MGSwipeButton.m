/*
 * MGSwipeTableCell is licensed under MIT licensed. See LICENSE.md file for more information.
 * Copyright (c) 2014 Imanol Fernandez @MortimerGoro
 */

#import "MGSwipeButton.h"

@class MGSwipeTableCell;

@interface MGSwipeButton ()

@property (nonatomic, strong) UIColor *inProgressColor;
@property (nonatomic, strong) NSString *inProgressTitle;

@property (nonatomic, strong) UIColor *completedColor;
@property (nonatomic, strong) NSString *completedTitle;

@end

@implementation MGSwipeButton

+(instancetype) buttonWithTitle:(NSString *) title backgroundColor:(UIColor *) color
{
    return [MGSwipeButton buttonWithTitle:title icon:nil backgroundColor:color];
}

+(instancetype) buttonWithTitle:(NSString *) title backgroundColor:(UIColor *) color callback:(MGSwipeButtonCallback) callback
{
    return [MGSwipeButton buttonWithTitle:title icon:nil backgroundColor:color callback:callback];
}

+(instancetype) buttonWithTitle:(NSString *) title icon:(UIImage*) icon backgroundColor:(UIColor *) color
{
    return [MGSwipeButton buttonWithTitle:title icon:icon backgroundColor:color callback:nil];
}

+(instancetype) buttonWithTitle:(NSString *) title icon:(UIImage*) icon backgroundColor:(UIColor *) color callback:(MGSwipeButtonCallback) callback
{
    MGSwipeButton * button = [MGSwipeButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = color;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setImage:icon forState:UIControlStateNormal];
    button.callback = callback;
    [button sizeToFit];
    CGRect frame = button.frame;
    frame.size.width += 10; //padding
    frame.size.width = MAX(200, frame.size.width); //initial min size
    button.frame = frame;
    
    [button.titleLabel setFont:[UIFont fontWithName:@"OpenSans" size:12]];
    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [button setImageEdgeInsets:UIEdgeInsetsMake(-25, 25, 0, 0)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(55, 0, 0, 0)];
    
    return button;
}

- (void)adjustSize {
}

-(BOOL) callMGSwipeConvenienceCallback: (MGSwipeTableCell *) sender
{
    if (_callback) {
        return _callback(sender);
    }
    return NO;
}

// Added methods
@synthesize inProgressColor, inProgressTitle, completedColor, completedTitle;

+ (instancetype)buttonWithIcon:(UIImage *)icon {
    return [MGSwipeButton buttonWithTitle:@"" icon:icon backgroundColor:nil callback:nil];
}


- (void)setTitle:(NSString *)title andColor:(UIColor *)color forSwipeState:(SwipeState)state {
    switch (state) {
        case SwipeStateInProgress:
            [self setInProgressColor:color];
            [self setInProgressTitle:title];
            [self setBackgroundColor:color];
            [self setTitle:title forState:UIControlStateNormal];
            break;
            
        case SwipeStateCompleted:
            [self setCompletedColor:color];
            [self setCompletedTitle:title];
            break;
            
        default:
            break;
    }
}

- (void)updateForSwipeState:(SwipeState)state {
    switch (state) {
        case SwipeStateInProgress:
            [self setTitle:self.inProgressTitle forState:UIControlStateNormal];
            [self setBackgroundColor:self.inProgressColor];
            break;
            
        case SwipeStateCompleted:
            [self setTitle:self.completedTitle forState:UIControlStateNormal];
            [self setBackgroundColor:self.completedColor];
            break;
            
        default:
            break;
    }
}

@end
