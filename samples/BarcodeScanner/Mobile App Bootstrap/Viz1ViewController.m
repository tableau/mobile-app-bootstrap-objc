//
//  Viz1ViewController.m
//  Mobile App Bootstrap
//
//  Created by Ron Theis on 10/23/16.
//  Copyright © 2016 Tableau. All rights reserved.
//

#import "Viz1ViewController.h"
#import "WebViewDelegate.h"


@implementation Viz1ViewController
    WebViewDelegate *webViewDelegate;

    // The URL pointing to our viz.
    // The field with the barcode is named "MRN (Scanning Field)" in our viz, and we want to filter based on this field.
    // So we send field=value as a query parameter.
    // Note the %20, %28, and %29 in place of spaces and parentheses in the field name, as the field name has to be urlencoded.
    NSString *baseURLString = @"https://public.tableau.com/shared/PWRZGPFSD?:embed=y&:tooltip=n&:toolbar=n&:showVizHome=no&MRN%20%28Scanning%20Field%29=";

    // Save this in case we're asked to load a barcode before we're ready.
    NSString *barCodeToLoad;


- (void)viewDidLoad {
    [super viewDidLoad];

    // Set up our WebViewDelegate.
	webViewDelegate = [[WebViewDelegate alloc] init];
	self.webView.navigationDelegate = webViewDelegate;
	
    // If we've got a barcode from earlier, load it here.
    if (barCodeToLoad != nil) {
        [self loadBarcodeInWebView: barCodeToLoad];
        barCodeToLoad = nil;
    }
}

- (void)loadVizForBarcode:(NSString *)scannedString {
    // Our viz field is expecting all digits, and our barcodes are all digits.
    // But if the user scans a different kind of barcode it could pass in characters like '&' which would need to be URL-encoded.
    // You'll also want to sanity-check the barcode string to ensure it meets your requirements (length, content, etc.), either here or in HomeViewController.
    
    NSString *escapedString = [scannedString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    
    if (self.webView == nil) {
        // We haven't made the WebView yet, so save the barcode to load after we've started things up in viewDidLoad.
        barCodeToLoad = escapedString;
    } else {
        [self loadBarcodeInWebView: escapedString];
    }
}

- (void)loadBarcodeInWebView:(NSString *)barcode {
    
    // Append the barcode to the end of the URL.
    NSString *vizWithFilterURLString = [baseURLString stringByAppendingString:barcode];
    
    // Create the URL, tell our webview to load it.
    NSURL *url = [NSURL URLWithString:vizWithFilterURLString];
    [self.webView loadRequest:[NSURLRequest requestWithURL: url]];
}


@end
