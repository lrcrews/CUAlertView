CUAlertView
===========

The CUAlertView is a nice way to present a short message to your user without sacrificing screen real-estate.

The view itself will be the width of its parent with the height based on the message being displayed.

This example project shows off the view as it is configured for the ChipUp app. (if you want to pretend that "CU" is a clever name for "See You" and not the initials of the app we won't mind… except that we'd like you to know we'd actually be cleverer than that… probably.)  

To match the look & feel of your app you may easily configure:
* the background gradient (or make it a solid color)
* the corner radius
* the UIFont used
* the text color
* the text alignment
* plus the animation timings and view paddings are configurable as well


OK, so how to I use this in my project?
=======================================

Well,

    1. Add the CUAlertView.h/.m to your project
    2. Find a place where you want one of these alert views
        2.1. Set 'Clip Subviews' to YES on the view (parent) that will display the alert
    3. Call the method

What method you ask?  Either…

    [CUAlertView showMessage:@"Some people think cucumbers taste better pickled"
                      inView:parentView];

Or, if you want the view to stay visible for a time other than the default…

    [CUAlertView showMessage:@"Intentionally Left Blank"
                 forDuration:4.0f
                      inView:[self view]];

That's it.

Run the project in the simulator to see the view in action.  Hope you find this helpful =]