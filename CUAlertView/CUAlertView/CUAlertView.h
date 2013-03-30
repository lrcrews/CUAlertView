//
//  CUAlertView.h
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

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


// IMPORTANT!  Don't forget to select the 'Clip Subviews' option on
//              any view that you will show an alert in.  If you do
//              forget it shall be immediately apparent to you when
//              you look at it on yhe simulator/device.


//  The duration of the show/hide slide animations
//
#define CUALERTVIEW_ANIMATION_DURATION 0.5


//  The default show duration
//
//  Used in:
//      + (void)showMessage:(NSString *)message;
//
#define CUALERTVIEW_DEFAULT_SHOW_DURATION 2.0


//  The animation transitions have a 'bounce' effect.
//  This defines the distance, and therefore prominence,
//  of this effect
//
#define CUALERTVIEW_ANIMATION_BOUNCE_DISTANCE 8.0f


//  The background of the alert view itself
//
//  Edit these values to match your app's color palate/theme
//
//  If you wish for the color to be solid set both
//  definitions to the same value
//
#define CUALERTVIEW_GRADIENT_TOP_COLOR_CODE @"#951717"
#define CUALERTVIEW_GRADIENT_BOTTOM_COLOR_CODE @"#4B100F"


//  The font used in the alert view
//
#define CUALERTVIEW_FONT [UIFont systemFontOfSize:14.0f]


//  The HEX code for the color of the message
//
#define CUALERTVIEW_TEXT_COLOR_CODE @"#ffffff"


//  The line break mode to use for the UILabel displaying
//  the given message
//
#define CUALERTVIEW_LINE_BREAK_MODE NSLineBreakByWordWrapping


//  The text alignment to use for the UILabel displaying
//  the given message
//
#define CUALERTVIEW_TEXT_ALIGNMENT NSTextAlignmentCenter


//  The padding values for the UILabel that displays
//  the given message
//
#define CUALERTVIEW_MESSAGE_PADDING_TOP 4.0f
#define CUALERTVIEW_MESSAGE_PADDING_RIGHT 2.0f
#define CUALERTVIEW_MESSAGE_PADDING_BOTTOM 4.0f
#define CUALERTVIEW_MESSAGE_PADDING_LEFT 2.0f


@interface CUAlertView : UIView


//  Shows the given message for CUALERTVIEW_DEFAULT_SHOW_DURATION seconds,
//  not counting the time of the animations (showing/hiding),
//  CUALERTVIEW_ANIMATION_DURATION * 2.
//
//  The view itself takes the width of it's super view and the height
//  is dependent on the string given based on the messageFont property,
//  plan accordingly.
//
//
//  @param message
//      NSString *
//      the message to display
//
//  @param parentView
//      UIView *
//      the view that will display this message
//
+ (void)showMessage:(NSString *)message
             inView:(UIView *)parentView;


//  Shows the given message for over the given duration,
//  not counting the time of the animations (showing/hiding),
//  CUALERTVIEW_ANIMATION_DURATION * 2.
//
//  The view itself takes the width of it's super view and the height
//  is dependent on the string given based on the messageFont property,
//  plan accordingly.
//
//
//  @param message
//      NSString *
//      the message to display
//
//  @param durationInSeconds
//      NSTimeInterval
//      the duration, in seconds, to show the message
//
//  @param parentView
//      UIView *
//      the view that will display this message
//
+ (void)showMessage:(NSString *)message
        forDuration:(NSTimeInterval)durationInSeconds
             inView:(UIView *)parentView;


@end
