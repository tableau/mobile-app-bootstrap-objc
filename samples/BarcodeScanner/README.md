# Mobile App Bootstrap sample: Barcode Scanner

A sample app to demonstrate using the camera to scan a barcode and filter a viz based on the barcode.

## Installation

Hopefully straightforward:

1. This sample should have been downloaded as part of the entire Mobile App Bootstrap [repository](https://github.com/tableau/mobile-app-bootstrap), as this sample refers to some files in higher-level directories.

Note: Older versions of git might need `git submodule update --init --recursive` run from this directory. If this Barcode Scanner directory has a populated `MTBBarcodeScanner` directory, then running the extra git command shouldn't be necessary.

## Starting the Tableau Sample App

1. Open `Mobile App Bootstrap.xcodeproj` in Xcode
2. Choose/click "Run"

This will literally get the app running, but if it's run in a (camera-less) simulator, a dialog will appear about missing a camera.

For added flavor, try:
3. Print out `sample-barcodes.png` on paper.
4. In Xcode, choose to run the app on a physical phone/tablet with a camera.
5. On-device, permit access to the camera via the dialog.
6. Point the now-scanning camera in the app at one of the barcodes on paper.
7. Once the scanner detects a barcode, the viz should load, filtered to that barcode.

# Project Layout

`HomeViewController` contains the scanning code, using the delightful [MTBBarcodeScanner](https://github.com/mikebuss/MTBBarcodeScanner) library to interface with the built-in iOS barcode scanning functionality.

`Viz1ViewController` just shows the viz, with a field filtered to the scanned barcode value.

## Customization Points

`AppDelegate.m`  
Change `https://public.tableau.com` to your internal server.

`Viz1ViewController.m`
Change the viz URL to point to your own viz. Be sure to change the URL query parameters to match your field containing barcode values.

`HomeViewController.m`  
The method `parseValidBarCodeFromScannedString` contains some logic to sanity-check the barcode. This check could take place here or in `Viz1ViewController`. The string returned from the barcode scanner could be literally anything (letters, numbers, symbols, emojis, URLs, javascript, etc.), so it needs to be sanitized.

[MTBBarcodeScanner](https://github.com/mikebuss/MTBBarcodeScanner) itself has some pretty interesting sample code, demonstrating things like drawing a rectangle around a found barcode, turning on the camera flash, etc. 

# Future Plans

* None at this point.

* Anything else you'd like to see? Please get in touch with us through the [Tableau Developer Community](developer.tableau.com)!


# Support

This collection is not officially 'blessed' by Tableau Engineering or Support. What does that mean? We didn't have a QA team test it. It's a tool for learning how to embed vizzes inside a mobile application. You should not expect that there are 0 bugs.

If you have problems getting it to work, feel free to email us with questions, but we can't promise quick responses. The [Tableau Developer Community](developer.tableau.com) is also a great resource if you need help.

A standard disclaimer: mobile-app-bootstrap is made available AS-IS with no support and no warranty whatsoever. Despite efforts to write good and useful code there may be bugs that cause unexpected and undesirable behavior. The software is strictly “use at your own risk.”

The good news: This is intended to be a self-service tool. You are free to modify it in any way to meet your needs.


