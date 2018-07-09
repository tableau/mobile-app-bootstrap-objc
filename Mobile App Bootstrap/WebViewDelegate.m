//
//  WebViewDelegate.m
//  Mobile App Bootstrap
//
//  Created by Ron Theis on 10/23/16.
//  Copyright © 2016 Tableau. All rights reserved.
//

#import "WebViewDelegate.h"
#import "TokenManager.h"

@implementation WebViewDelegate

# pragma mark WKNavigationDelegate

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation; {
    if ((webView != nil) && (webView.URL != nil)) {
        
        // Create tokens if needed; this will check our cookies before requesting.
        [TokenManager createTokensIfNeeded:webView.URL];
    }
}

@end
