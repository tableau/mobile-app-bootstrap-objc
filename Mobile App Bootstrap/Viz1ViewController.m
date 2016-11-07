//
//  Viz1ViewController.m
//  Mobile App Bootstrap
//
//  Created by Ron Theis on 10/23/16.
//  Copyright © 2016 Tableau. All rights reserved.
//

#import "Viz1ViewController.h"
#import "WebViewDelegate.h"

@implementation Viz1ViewController{
    WebViewDelegate *webViewDelegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
	
	webViewDelegate = [[WebViewDelegate alloc] init];
	self.webView.delegate = webViewDelegate;

    [self loadVizWebView];
}

- (void)loadVizWebView {

    // Parameters for passing to the viz:
    // http://onlinehelp.tableau.com/current/server/en-us/embed_list.htm
    // :embed=y hides the top nav area
    // :tooltip=n hides tooltips. Mainly because "View Data" in a tooltip navigates to a new page, and our sample-code webviews don't have a back button. (Yet!)
    // :toolbar=n hides the toolbar. The toolbar is cool, but it has some functionality that this sample code doesn't handle.
    // :showVizHome=no is to remove the top chrome on Public
    
    NSURL *url = [NSURL URLWithString:@"https://public.tableau.com/views/10_0InternationalTourism/InternationalTourism?:embed=y&:tooltip=n&:toolbar=n&:showVizHome=no"];

    [self.webView loadRequest:[NSURLRequest requestWithURL: url]];
}

@end
