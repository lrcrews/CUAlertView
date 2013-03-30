//
//  CUAlertView.m
//  CUAlertView
//
//  Created by L Ryan Crews on 3/27/13.
//  Copyright (c) 2013 L Ryan Crews & chipup
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//  Have a nice day.
//

#import "CUAlertView.h"


#pragma mark -
#pragma mark Mysterious sci-fi rhymes always getting hotter

@interface CUAlertView ()


@property (nonatomic, strong) NSString * message;
@property NSTimeInterval duration;
@property (nonatomic, weak) UIView * parentView;


@end


#pragma mark -
#pragma mark Drunk in the club watch me holler at your daughter

@implementation CUAlertView


#pragma mark -
#pragma mark ...it's from 'Flow Like Poe' ~ MC Lars

- (id)initWithMessage:(NSString *)message
          forDuration:(NSTimeInterval)durationInSeconds
         inParentView:(UIView *)parentView;
{
    CGFloat parentWidth = parentView.bounds.size.width;
    
    CGFloat labelWidth = parentWidth - CUALERTVIEW_MESSAGE_PADDING_LEFT - CUALERTVIEW_MESSAGE_PADDING_RIGHT;
    CGFloat labelHeight = [CUAlertView heightForMessage:message
                                     constrainedToWidth:labelWidth];
    
    CGFloat viewHeight = labelHeight + CUALERTVIEW_MESSAGE_PADDING_TOP + CUALERTVIEW_MESSAGE_PADDING_BOTTOM + CUALERTVIEW_ANIMATION_BOUNCE_DISTANCE;
    
    self = [super initWithFrame:CGRectMake(0.0, -viewHeight, parentWidth, viewHeight)];
    if (self)
    {
        [self setMessage:message];
        [self setDuration:durationInSeconds];
        [self setParentView:parentView];
        
        CAGradientLayer * gradientBG = [CAGradientLayer layer];
        gradientBG.frame = [self bounds];
        gradientBG.colors = @[(id)[[self uicolorFromHexString:CUALERTVIEW_GRADIENT_TOP_COLOR_CODE] CGColor], (id)[[self uicolorFromHexString:CUALERTVIEW_GRADIENT_BOTTOM_COLOR_CODE] CGColor]];
        [self.layer insertSublayer:gradientBG
                           atIndex:0];
        
        UILabel * messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(CUALERTVIEW_MESSAGE_PADDING_LEFT, CUALERTVIEW_MESSAGE_PADDING_TOP + CUALERTVIEW_ANIMATION_BOUNCE_DISTANCE, labelWidth, labelHeight)];
        [messageLabel setNumberOfLines:0];
        [messageLabel setLineBreakMode:CUALERTVIEW_LINE_BREAK_MODE];
        [messageLabel setTextAlignment:CUALERTVIEW_TEXT_ALIGNMENT];
        [messageLabel setFont:CUALERTVIEW_FONT];
        [messageLabel setBackgroundColor:[UIColor clearColor]];
        [messageLabel setTextColor:[self uicolorFromHexString:CUALERTVIEW_TEXT_COLOR_CODE]];
        [messageLabel setText:_message];
        
        [self addSubview:messageLabel];
    }
    
    return self;
}


#pragma mark -
#pragma mark Entry Methods

+ (void)showMessage:(NSString *)message
             inView:(UIView *)parentView;
{
    [CUAlertView showMessage:message
                 forDuration:CUALERTVIEW_DEFAULT_SHOW_DURATION
                      inView:parentView];
}


+ (void)showMessage:(NSString *)message
        forDuration:(NSTimeInterval)durationInSeconds
             inView:(UIView *)parentView;
{
    CUAlertView * alert = [[CUAlertView alloc] initWithMessage:message
                                                   forDuration:durationInSeconds
                                                  inParentView:parentView];
    
    [alert.parentView addSubview:alert];
    
    [alert animateShow];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, [alert duration] * NSEC_PER_SEC),
                   dispatch_get_main_queue(),
                   ^{
                       [alert animateHide];
                   });
}


#pragma mark -
#pragma mark Helper Methods

+ (CGFloat)heightForMessage:(NSString *)message
         constrainedToWidth:(CGFloat)widthConstraint
{
    CGSize labelSize = [message sizeWithFont:CUALERTVIEW_FONT
                           constrainedToSize:CGSizeMake(widthConstraint, CGFLOAT_MAX)
                               lineBreakMode:CUALERTVIEW_LINE_BREAK_MODE];
    
    return labelSize.height;
}


- (void)animateShow;
{
    __block CGRect alertFrame = [self frame];
    
    [UIView animateWithDuration:CUALERTVIEW_ANIMATION_DURATION * 0.8f
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^
                     {
                         alertFrame.origin.y += alertFrame.size.height;
                         [self setFrame:alertFrame];
                     }
                     completion:^(BOOL finished)
                     {
                         [UIView animateWithDuration:CUALERTVIEW_ANIMATION_DURATION * 0.2f
                                               delay:0.0
                                             options:0
                                          animations:^
                                          {
                                              alertFrame.origin.y -= CUALERTVIEW_ANIMATION_BOUNCE_DISTANCE;
                                              [self setFrame:alertFrame];
                                          }
                                          completion:nil];
                     }];
}


- (void)animateHide;
{
    __block CGRect alertFrame = [self frame];
    
    [UIView animateWithDuration:CUALERTVIEW_ANIMATION_DURATION * 0.2f
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^
                     {
                         alertFrame.origin.y += CUALERTVIEW_ANIMATION_BOUNCE_DISTANCE;
                         [self setFrame:alertFrame];
                     }
                     completion:^(BOOL finished)
                     {
                         [UIView animateWithDuration:CUALERTVIEW_ANIMATION_DURATION * 0.8f
                                               delay:0.0
                                             options:0
                                          animations:^{
                                              alertFrame.origin.y -= alertFrame.size.height;
                                              [self setFrame:alertFrame];
                                          }
                                          completion:^(BOOL finished)
                                          {
                                              [self removeFromSuperview];
                                          }];
                     }];
}


//  Typically I would have this in a NSString+utils category so that the
//  call would look like [@"#ff33d2" toUIColor], but in an effort to keep
//  this completely self contained this method is here and takes in the
//  NSString as a parameter.
//
- (UIColor *)uicolorFromHexString:(NSString *)hexColorCode
{
    unsigned int c;
    
    if ([hexColorCode characterAtIndex:0] == '#')
    {
        [[NSScanner scannerWithString:[hexColorCode substringFromIndex:1]] scanHexInt:&c];
    }
    else
    {
        [[NSScanner scannerWithString:hexColorCode] scanHexInt:&c];
    }
    
    
    return [UIColor colorWithRed:((c & 0xff0000) >> 16)/255.0
                           green:((c & 0xff00) >> 8)/255.0
                            blue:(c & 0xff)/255.0
                           alpha:1.0];
}


@end
