//
//  Viz3ViewController.m
//  Mobile App Bootstrap
//
//  Created by Ron Theis on 10/23/16.
//  Copyright © 2016 Tableau. All rights reserved.
//

#import "Viz3ViewController.h"
#import "WebViewDelegate.h"

@implementation Viz3ViewController{
    WebViewDelegate *webViewDelegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
	
	NSURL *url = [NSURL URLWithString:@"https://public.tableau.com/views/10_0SuperstoreSales/Overview?:embed=y&:tooltip=n&:toolbar=n&:showVizHome=no"];
    
    webViewDelegate = [[WebViewDelegate alloc] init];
    self.webView.navigationDelegate = webViewDelegate;
	
    [self.webView loadRequest:[NSURLRequest requestWithURL: url]];
}

@end
