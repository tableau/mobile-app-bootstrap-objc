//
//  TabDelegate.m
//  Mobile App Bootstrap
//
//  Created by Madeleine Cwik on 11/7/16.
//  Copyright © 2016 Tableau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TabDelegate.h"
#import "HomeViewController.h"
#import "Viz1ViewController.h"
#import "Viz2ViewController.h"
#import "Viz3ViewController.h"

@implementation TabDelegate
{
    NSUInteger previouslySelectedTabIndex;
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {

    //    You could also use reload the home screen on every tap
    //    by uncommenting this section
    //
    //    if ([viewController isKindOfClass:[HomeViewController class]])
    //    {
    //        [(HomeViewController*) viewController loadHomeWebView];
    //    }

    if (previouslySelectedTabIndex == tabBarController.selectedIndex)
    {
        if ([viewController isKindOfClass:[HomeViewController class]])
        {
            [(HomeViewController*) viewController loadHomeWebView];
        }
        else if ([viewController isKindOfClass:[Viz1ViewController class]])
        {
            [(Viz1ViewController*) viewController loadVizWebView];
        }
        else if ([viewController isKindOfClass:[Viz2ViewController class]])
        {
            [(Viz2ViewController*) viewController loadVizWebView];
        }
        else if ([viewController isKindOfClass:[Viz3ViewController class]])
        {
            [(Viz3ViewController*) viewController loadVizWebView];
        }
    }

    previouslySelectedTabIndex = tabBarController.selectedIndex;
}

@end
