//
//  TokenManager.h
//  Mobile App Bootstrap
//
//  Created by Ron Theis on 10/23/16.
//  Copyright © 2016 Tableau. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TokenManager : NSObject

+ (void)loadCookiesFromStorageForServer: (nonnull NSURL *) serverUrl ;
+ (void)createTokensIfNeeded: (nonnull NSURL *) serverUrl;

@end
