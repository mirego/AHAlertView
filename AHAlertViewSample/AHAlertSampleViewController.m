//
//  AHAlertSampleViewController.m
//  AHAlertViewSample
//
//	Copyright (C) 2012 Auerhaus Development, LLC
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy of
//	this software and associated documentation files (the "Software"), to deal in
//	the Software without restriction, including without limitation the rights to
//	use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//	the Software, and to permit persons to whom the Software is furnished to do so,
//	subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//	FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//	COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//	IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//	CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "AHAlertSampleViewController.h"
#import "AHAlertView.h"

static const NSInteger kAHViewAutoresizingFlexibleMargins =
	UIViewAutoresizingFlexibleLeftMargin |
	UIViewAutoresizingFlexibleRightMargin |
	UIViewAutoresizingFlexibleTopMargin |
	UIViewAutoresizingFlexibleBottomMargin;

@implementation AHAlertSampleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor grayColor];

	[self initializeUserInterface];
}

- (void)initializeUserInterface
{
	UIEdgeInsets buttonEdgeInsets = UIEdgeInsetsMake(20, 8, 20, 8);

	UIImage *buttonImage = [[UIImage imageNamed:@"custom-cancel-normal"]
							resizableImageWithCapInsets:buttonEdgeInsets];

	CGPoint viewCenter = self.view.center;

	CGSize buttonSize = CGSizeMake(144, 44);
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setBackgroundImage:buttonImage forState:UIControlStateNormal];
	button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
	button.frame = CGRectMake(viewCenter.x - buttonSize.width * 0.5, viewCenter.y - 80, buttonSize.width, buttonSize.height);
	button.autoresizingMask = kAHViewAutoresizingFlexibleMargins;
	[button setTitle:@"Show Alert View" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];

	CGSize labelSize = CGSizeMake(120, 16);
	CGRect labelFrame = CGRectMake(viewCenter.x - labelSize.width * 0.5, viewCenter.y + 80, labelSize.width, labelSize.height);
	UILabel *switchLabel = [[UILabel alloc] initWithFrame:labelFrame];
	switchLabel.text = @"Custom Styles";
	switchLabel.textAlignment = AHTextAlignmentCenter;
	switchLabel.font = [UIFont boldSystemFontOfSize:15];
	switchLabel.backgroundColor = [UIColor clearColor];
	switchLabel.autoresizingMask = kAHViewAutoresizingFlexibleMargins;
	[self.view addSubview:switchLabel];

	UISwitch *appearanceSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
	CGSize switchSize = appearanceSwitch.bounds.size;
	CGRect switchFrame = CGRectMake(viewCenter.x - switchSize.width * 0.5, viewCenter.y + 120, switchSize.width, switchSize.height);
	appearanceSwitch.frame = switchFrame;
	[appearanceSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
	appearanceSwitch.autoresizingMask = kAHViewAutoresizingFlexibleMargins;
	[self.view addSubview:appearanceSwitch];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)buttonWasPressed:(id)sender
{
	NSString *title = @"Alert View Title";
	NSString *message = @"This is a message that might prompt you to do something.";
	
	AHAlertView *alert = [[AHAlertView alloc] initWithTitle:title message:message];
	__weak AHAlertView *weakAlert = alert;
	[alert setCancelButtonTitle:@"Tumble" block:^{
		weakAlert.dismissalStyle = AHAlertViewDismissalStyleTumble;
	}];
	[alert addButtonWithTitle:@"Zoom Down" block:^{
		weakAlert.dismissalStyle = AHAlertViewDismissalStyleZoomDown;
	}];
	[alert show];
}

- (void)switchValueChanged:(UISwitch *)sender
{
	if(sender.isOn)
		[self applyCustomAlertAppearance];
	else
		[AHAlertView applySystemAlertAppearance];
}

- (void)applyCustomAlertAppearance
{
	[[AHAlertView appearance] setContentInsets:UIEdgeInsetsMake(12, 18, 12, 18)];
	
	[[AHAlertView appearance] setBackgroundImage:[UIImage imageNamed:@"custom-dialog-background"]];
	
	UIEdgeInsets buttonEdgeInsets = UIEdgeInsetsMake(20, 8, 20, 8);
	
	UIImage *cancelButtonImage = [[UIImage imageNamed:@"custom-cancel-normal"]
								  resizableImageWithCapInsets:buttonEdgeInsets];
	UIImage *normalButtonImage = [[UIImage imageNamed:@"custom-button-normal"]
								  resizableImageWithCapInsets:buttonEdgeInsets];

	[[AHAlertView appearance] setCancelButtonBackgroundImage:cancelButtonImage
													forState:UIControlStateNormal];
	[[AHAlertView appearance] setButtonBackgroundImage:normalButtonImage
											  forState:UIControlStateNormal];

	[[AHAlertView appearance] setTitleTextAttributes:[AHAlertView textAttributesWithFont:[UIFont boldSystemFontOfSize:18]
																		 foregroundColor:[UIColor whiteColor]
																			 shadowColor:[UIColor blackColor]
																			shadowOffset:CGSizeMake(0, -1)]];

	[[AHAlertView appearance] setMessageTextAttributes:[AHAlertView textAttributesWithFont:[UIFont systemFontOfSize:14]
																		   foregroundColor:[UIColor colorWithWhite:0.8 alpha:1.0]
																			   shadowColor:[UIColor blackColor]
																			  shadowOffset:CGSizeMake(0, -1)]];

	[[AHAlertView appearance] setButtonTitleTextAttributes:[AHAlertView textAttributesWithFont:[UIFont boldSystemFontOfSize:14]
																			   foregroundColor:[UIColor whiteColor]
																				   shadowColor:[UIColor blackColor]
																				  shadowOffset:CGSizeMake(0, -1)]];
}

@end
