//
//  ViewController.m
//  CUAlertView
//
//  All images used in this are from
//  http://www.facebook.com/pages/Lil-Tuffy/181327012727
//
//  Lil Tuffy makes gig posters, awesome ones, I own a few.
//  If you happen to like anything you see go check him out.
//
//  Created by L Ryan Crews on 3/27/13.
//  Copyright (c) 2013 chipup. All rights reserved.
//

#import "ViewController.h"

#import "CUAlertView.h"


#pragma mark -
#pragma mark Privateering

@interface ViewController ()


@property (nonatomic, strong) IBOutlet UIView * splashView;
@property (nonatomic, strong) IBOutlet UIView * portrait1View;
@property (nonatomic, strong) IBOutlet UIView * portrait2View;
@property (nonatomic, strong) IBOutlet UIView * landscapeView;


@end


#pragma mark -
#pragma mark Viewing Area

@implementation ViewController
{
    NSArray * imageMessages_;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [CUAlertView showMessage:@"Welcome Back!"
                      inView:[self view]];
    
    imageMessages_ = @[ @"Lil Tuffy, Graphic Designer", @"The Black Keys", @"Best Coast" ]; // Tags set in IB to match to this array.
    
    UITapGestureRecognizer * splashTapper = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(viewTapped:)];
    [self.splashView addGestureRecognizer:splashTapper];
    
    UITapGestureRecognizer * portrait1Tapper = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(viewTapped:)];
    [self.portrait1View addGestureRecognizer:portrait1Tapper];
    
    UITapGestureRecognizer * portrait2Tapper = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(viewTapped:)];
    [self.portrait2View addGestureRecognizer:portrait2Tapper];
}


#pragma mark -
#pragma mark Touchy Stuff

- (void)viewTapped:(UITapGestureRecognizer *)gesture;
{
    UIView * tappedView = [gesture view];
    NSString * message = imageMessages_[[tappedView tag]];
    
    [CUAlertView showMessage:message
                      inView:tappedView];
}


@end
