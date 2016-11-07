//
//  Viz3ViewController.h
//  Mobile App Bootstrap
//
//  Created by Ron Theis on 10/23/16.
//  Copyright © 2016 Tableau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Viz3ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;

- (void)loadVizWebView;

@end
