//
//  ModalSplitViewController.m
//
//  Created by tfalencar on 13/11/13.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2013 Thiago Faria Alencar
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "ModalSplitViewController.h"

@implementation ModalSplitViewController

@synthesize masterViewController, detailViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)presentWithMasterViewController: (UIViewController *) thisMasterViewController
       andDetailViewController: (UIViewController *) thisDetailViewController
                            completion:(void(^)(void))completion
{
    masterViewController = thisMasterViewController;
    detailViewController = thisDetailViewController;
    
    [self setViewControllers:[NSArray arrayWithObjects:masterViewController, detailViewController, nil]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    self.window.rootViewController = self;
    
    [self.window makeKeyAndVisible];
    
    if(completion)
        completion();
}

-(void)dismissViewControllerWithCompletion:(void (^)(void))completion
 {
     self.window = nil;
     masterViewController = nil;
     detailViewController = nil;
     if(completion)
         completion();
 }

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
