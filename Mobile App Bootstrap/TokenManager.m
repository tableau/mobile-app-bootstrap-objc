//
//  TokenManager.m
//  Mobile App Bootstrap
//
//  Created by Ron Theis on 10/23/16.
//  Copyright © 2016 Tableau. All rights reserved.
//

#import "TokenManager.h"
#import "TableauOAuth.h"

@implementation TokenManager


static TableauOAuth *_auth;

+ (void)initialize {
	if (self == [TokenManager class]) {
		_auth = [[TableauOAuth alloc] init];
	}
}

+ (void)loadCookiesFromStorageForServer: (nonnull NSURL *) serverUrl {
    [_auth loadCookiesFromStorageForServer: serverUrl];
}

+ (void)createTokensIfNeeded: (nonnull NSURL *) serverUrl {
    [_auth requestTokensForSession:serverUrl];
}



@end
