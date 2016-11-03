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

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	if ((webView != nil) && (webView.request != nil) && (webView.request.URL != nil)) {

        // Create tokens if needed; this will check our cookies before requesting.
        [TokenManager createTokensIfNeeded:webView.request.URL];
	}
}

@end
