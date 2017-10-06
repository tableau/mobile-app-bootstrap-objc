# Mobile App Bootstrap: Objective-C preview
[![Community Supported](https://img.shields.io/badge/Support%20Level-Community%20Supported-457387.svg)](https://www.tableau.com/support-levels-it-and-developer-tools)

Provides an early look at example code for how to embed Tableau vizzes inside of a native iOS app.

## Prerequisites
At the moment, the Mobile App Bootstrap is only supported on iOS.

## Installation

Pretty straightforward:

1. Install Xcode
2. Download the code for the app from this [repository](https://github.com/tableau/mobile-app-bootstrap)

## Starting the Tableau Sample App

1. Open `Mobile App Bootstrap.xcodeproj` in Xcode
2. Choose/click "Run"

# Project Layout

The app is meant to be as simple as possible: a UITabBarController with 4 UIViewControllers, each containing a UIWebView. The UIViewControllers are separated into their own classes in this sample. The Home WebView opens a local web page bundled in the app, while the other 3 WebViews open visualizations hosted on Tableau Public.

Tableau Connected Clients are used, with a modified version of the Connected Clients library. Once this sample app is farther along (see Limitations, below), the modifications to the Connected Clients library will be submitted to its repo.

## Customization Points

`AppDelegate.m`  
Change `https://public.tableau.com` to your internal server.

`Viz1ViewController.m`, `Viz2ViewController.m`, `Viz3ViewController.m`  
Change the viz URLs to point to your own visualizations. Consider including the URL query parameters in the sample URLs, described in more detail in comments in `Viz1ViewController.m`.

`www/index.html`  
Modify to suit.

# Limitations

This code is strictly an early look, and is sadly far from complete.

* Links within WebViews  
Tapping a link in one of these WebViews will follow the link...but there isn't a Back button included with this sample.  

* Connected Clients  
Connected Clients are implemented, via a simple Token Manager. Unfortunately it doesn't yet perform re-authentication. So while it will keep the user signed in between app runs and device reboots, it will timeout based on Tableau Server's setting. On Server, this is configuralbe via its .yml file:  
`wgserver.session.idle_limit: 240`  
That value is in minutes, and affects all clients: Web, Desktop, and Mobile.

* Sign In on Phone  
The Sign In experience on a phone is, charitably: nonoptimal. There's a way to inject some CSS into the WebView to make things lok nicer, via some JavaScript:  
`"var styleNode = document.createElement('style'); styleNode.type = 'text/css'; styleNode.innerHTML = ' .tb-login{min-width:0 !important; width: " + width + "px; } .tb-login-site-picker-container {margin-left: 50px; margin-right: 50px; } '; document.getElementsByTagName('head')[0].appendChild(styleNode);"`  
WebView has `EvaluateJavascript` for passing this in. Sadly, the sample code doesn't yet implement this.

* Sign In approach  
In this sample, Sign In happen inside the same viz as the WebView...this might need to be broken out in a separate WebView that only processes Sign In.

# Future Plans

* Address the Limitations above

* Show how WkWebView could be used instead of UIWebView, for better visualization and memory performance.

* Anything else you'd like to see? Please get in touch with us through the [Tableau Developer Community](developer.tableau.com)!


# Support

This collection is supported by the community and not officially 'blessed' by Tableau Engineering or Support. What does that mean? We didn't have a QA team test it. It's a tool for learning how to embed vizzes inside a mobile application. You should not expect that there are 0 bugs.

If you have problems getting it to work, feel free to email us with questions, but we can't promise quick responses. The [Tableau Developer Community](developer.tableau.com) is also a great resource if you need help.

A standard disclaimer: mobile-app-bootstrap is made available AS-IS with no support and no warranty whatsoever. Despite efforts to write good and useful code there may be bugs that cause unexpected and undesirable behavior. The software is strictly “use at your own risk.”

The good news: This is intended to be a self-service tool. You are free to modify it in any way to meet your needs.


