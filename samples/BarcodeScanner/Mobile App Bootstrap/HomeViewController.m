//
//  HomeViewController.m
//  Mobile App Bootstrap
//
//  Created by Ron Theis on 10/23/16.
//  Copyright © 2016 Tableau. All rights reserved.
//

#import "HomeViewController.h"
#import "MTBBarcodeScanner.h"
#import "Viz1ViewController.h"

@interface HomeViewController ()

@property (nonatomic, weak) IBOutlet UIView *previewView;
@property (nonatomic, weak) IBOutlet UILabel *cameraUnavailableLabel;

@property (nonatomic, strong) MTBBarcodeScanner *scanner;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    
    // Check to see if we've got permission to access the camera.
    // If we haven't asked before, a dialog will be shown. It will include text set in Info.plist for the Camera Usage Description.
    [MTBBarcodeScanner requestCameraPermissionWithSuccess:^(BOOL success) {
        if (success) {
            // We have permission, so start scanning.
            self.cameraUnavailableLabel.hidden = true;
            [self startScanning];
        } else {
            // This is a little bit belt-and-suspenders: show an alert and show some text over the scanning view.
            self.cameraUnavailableLabel.hidden = false;
            [self displayPermissionMissingAlert];
        }
    }];
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [self stopScanning];
    [super viewWillDisappear:animated];
}

#pragma mark - Scanner

- (MTBBarcodeScanner *)scanner {
    if (!_scanner) {
        _scanner = [[MTBBarcodeScanner alloc] initWithPreviewView:_previewView];
    }
    return _scanner;
}

#pragma mark - Scanning

- (void)startScanning {
    
    NSError *error = nil;
    [self.scanner startScanningWithResultBlock:^(NSArray *codes) {
        for (AVMetadataMachineReadableCodeObject *code in codes) {
            if (code.stringValue) {
                NSLog(@"startScanning: found code: %@", code.stringValue);
                
                NSString *validBarcode = [self parseValidBarCodeFromScannedString:code.stringValue];
                
                if ([validBarcode compare:code.stringValue] == NSOrderedSame) {
                    
                    if ([self.parentViewController isKindOfClass:[UITabBarController class]]) {
                        UITabBarController *parent = (UITabBarController *)self.parentViewController;
                        
                        // Just sanity-check this.
                        if (parent.viewControllers.count < 2) {
                            NSLog(@"startScanning: our parent only has 1 VC? Bailing out!");
                            return;
                        }
                        
                        UIViewController *partnerVC = [parent.viewControllers objectAtIndex:1];
                        if (partnerVC && [partnerVC isKindOfClass:[Viz1ViewController class]]) {
                            // We've got the right VC, now tell it to load the viz and pass in the barcode.
                            Viz1ViewController *webViewVC = (Viz1ViewController *)partnerVC;
                            [webViewVC loadVizForBarcode:validBarcode];
                            
                            parent.selectedIndex = 1;
                        }
                    }
                }
            }
        }
    } error:&error];
    
    if (error) {
        NSLog(@"An error occurred: %@", error.localizedDescription);
    }
}

- (void)stopScanning {
    [self.scanner stopScanning];
}

#pragma mark - Helper Methods

- (void)displayPermissionMissingAlert {
    NSString *message = nil;
    if ([MTBBarcodeScanner scanningIsProhibited]) {
        message = @"This app does not have permission to use the camera.";
    } else if (![MTBBarcodeScanner cameraIsPresent]) {
        message = @"This device does not have a camera.";
    } else {
        message = @"An unknown error occurred.";
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Scanning Unavailable"
                                message:message
                               delegate:nil
                      cancelButtonTitle:@"Ok"
                      otherButtonTitles:nil] show];
}

- (NSString *)parseValidBarCodeFromScannedString:(NSString *)scannedString {
    // The scanner retrieved a string, but it could have anything inside...some other barcode we don't understand, a URL, javascript, etc.
    // So here we're trying to grab a barcode in a format that we expect. For valid codes friendly to us, this should just return the same thing the scanner saw.
    
    // Our sample barcodes are all integers.
    int scannedInt = [scannedString intValue];
    
    return [NSString stringWithFormat:@"%d",scannedInt];
}

@end
