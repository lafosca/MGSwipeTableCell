/*
 * MGSwipeTableCell is licensed under MIT licensed. See LICENSE.md file for more information.
 * Copyright (c) 2014 Imanol Fernandez @MortimerGoro
 */

#import "MGSwipeButton.h"

@class MGSwipeTableCell;

@interface MGSwipeButton ()

@end

@implementation MGSwipeButton

+ (instancetype)buttonWithIcon:(UIImage *)icon progressColor:(UIColor *)progressColor completedColor:(UIColor *)completedColor {
    MGSwipeButton *button = [MGSwipeButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:progressColor];
    [button setImage:icon forState:UIControlStateNormal];
    [button sizeToFit];
    [button setProgressColor:progressColor];
    [button setCompletedColor:completedColor];
    
    CGRect frame = button.frame;
    frame.size.width += 10; //padding
    frame.size.width = MAX(200, frame.size.width); //initial min size
    button.frame = frame;

    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 0)];

    return button;
}

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

-(BOOL) callMGSwipeConvenienceCallback: (MGSwipeTableCell *) sender
{
    if (_callback) {
        return _callback(sender);
    }
    return NO;
}
- (void)updateForSwipeState:(SwipeState)state {
    switch (state) {
        case SwipeStateInProgress:
            [self setBackgroundColor:self.progressColor];
            break;
            
        case SwipeStateCompleted:
            [self setBackgroundColor:self.completedColor];
            break;
            
        default:
            break;
    }
}

@end
