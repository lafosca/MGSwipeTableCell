/*
 * MGSwipeTableCell is licensed under MIT licensed. See LICENSE.md file for more information.
 * Copyright (c) 2014 Imanol Fernandez @MortimerGoro
 */

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    SwipeStateInProgress,
    SwipeStateCompleted
} SwipeState;


@class MGSwipeTableCell;

/** 
 * This is a convenience class to create MGSwipeTableCell buttons
 * Using this class is optional because MGSwipeTableCell is button agnostic and can use any UIView for that purpose
 * Anyway, it's recommended that you use this class because is totally tested and easy to use ;)
 */
@interface MGSwipeButton : UIButton

/**
 * Convenience block callback for developers lazy to implement the MGSwipeTableCellDelegate.
 * @return Return YES to autohide the swipe view
 */
typedef BOOL(^MGSwipeButtonCallback)(MGSwipeTableCell * sender);
@property (nonatomic, strong) MGSwipeButtonCallback callback;

/** 
 * Convenience static constructors
 */
+(instancetype) buttonWithTitle:(NSString *) title backgroundColor:(UIColor *) color;
+(instancetype) buttonWithTitle:(NSString *) title backgroundColor:(UIColor *) color callback:(MGSwipeButtonCallback) callback;
+(instancetype) buttonWithTitle:(NSString *) title icon:(UIImage*) icon backgroundColor:(UIColor *) color;
+(instancetype) buttonWithTitle:(NSString *) title icon:(UIImage*) icon backgroundColor:(UIColor *) color callback:(MGSwipeButtonCallback) callback;



+ (instancetype)buttonWithIcon:(UIImage *)icon;
- (void)setTitle:(NSString *)title andColor:(UIColor *)color forSwipeState:(SwipeState)state;
- (void)updateForSwipeState:(SwipeState)state;

@end