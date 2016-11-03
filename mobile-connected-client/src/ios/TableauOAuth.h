//
//  TableauOAuth.h
//

#ifndef TableauOAuth_h
#define TableauOAuth_h

#import <UIKit/UIKit.h>

@interface TableauOAuth : NSObject<NSURLConnectionDelegate>

/**
 Load cookies from keychain into cookie storage, where out WebViews can use them.
 */
- (void)loadCookiesFromStorageForServer: (nonnull NSURL *) serverUrl;

/**
 If we have a session cookie, check to see if we're signed in.
 If so, request OAuth tokens.
 @param serverUrl
 The name of the server.
 */
- (void)requestTokensForSession: (nonnull NSURL *) serverUrl;

/**
 Send request to Tableau Server to get initial OAuth access and request token.
 This method should only be called after a successful sign-in to ensure that the
 wg-session cookie is still valid.
 @param serverUrl
 The name of the server.
 */
- (void)requestOAuthTokens: (nonnull NSURL *) serverUrl;

/**
 Send request to server to check sign in status.
 @param serverUrl
 The name of the server. Should include http:// or https://
 ex: http://tableau.example.com
 @param siteName
 The name of the site that is displayed in the site url.
 @param successCallbackBlock
 Block containing code to execute if user is signed in.
 @param failureCallbackBlock
 Block containing code to execute if user is NOT signed in.
 */
- (void)checkSignInStatus: (nonnull NSURL *) serverUrl forSite:(nonnull NSString *) siteName successCallback:(nullable void (^)(void))successCallbackBlock failureCallback:(nullable void (^)(void))failureCallbackBlock;

/**
 Sign out by deleting cookies and OAuth tokens if they exist.
 @param serverUrl
 The name of the server.
 */
- (void)signOut: (nonnull NSURL *) serverUrl;

@end

#endif /* TableauOAuth_h */
