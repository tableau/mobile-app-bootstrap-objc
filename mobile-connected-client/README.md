# Mobile Connected Client Plugin

The Connected Client Plugin is an Objective-C library written to accompany the [Mobile App Bootstrap](https://github.com/tableau/mobile-app-bootstrap), 
but is also useful as a stand-alone class. It helps authenticate a user and keep them signed in using long-lived tokens. It can be used in the sample [Mobile App Bootstrap](https://github.com/tableau/mobile-app-bootstrap) or in another native mobile app.

As a plugin, it performs three authentication-related tasks:

1. Check if the user is signed in. This function should always be called before trying to load Tableau content.  
`TableauOAuth.checkSignInStatus()`
2. Manage long-lived tokens for a session. Long-lived tokens [must be enabled](https://onlinehelp.tableau.com/current/server/en-us/devices_connected_credentials.htm) on your server.  
`TableauOAuth.requestOAuthTokens()`
3. Sign out the user.  
`TableauOAuth.signOut()`


## Check Sign In Flow
```
           checkSignInStatus
                  |
        Is the session expired?
                  |
      __________________________
      |                           |
     NO                          YES
  User is signed in.              |
                          Does the app have tokens?
                                  |
                      __________________________
                      |                         |
                     YES                        NO
                      |                   User is NOT signed in.     
              Can they be refreshed?
                      |
              ___________________
             |                   |
            YES                  NO
      User is signed in.      User is NOT signed in.
                    
```

## Long-lived tokens

The plugin completes four main tasks in order to handle long-lived tokens.

1. Get initial access/refresh tokens
2. Store in iOS Keychain
3. Refresh access token if expired
4. Revoke refresh and access token on sign out

## Support

This collection is not officially 'blessed' by Tableau Engineering or Support. What does that mean? We didn't have a QA team test it. It's a tool for learning how to authenticate to Tableau Servers and stay signed-in using long-lived tokens. You should not expect that there are 0 bugs. If you have problems getting it to work, feel free to email us with questions, but we can't promise quick responses.

A standard disclaimer: mobile-connected-client is made available AS-IS with no support and no warranty whatsoever. Despite efforts to write good and useful code there may be bugs that cause unexpected and undesirable behavior. The software is strictly “use at your own risk.”
The good news: This is intended to be a self-service tool. You are free to modify it in any way to meet your needs.
