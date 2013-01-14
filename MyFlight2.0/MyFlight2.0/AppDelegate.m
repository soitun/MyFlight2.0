//
//  AppDelegate.m
//  MyFlight2.0
//
//  Created by Davidsph on 12/5/12.
//  Copyright (c) 2012 LIAN YOU. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "SearchFlightConditionController.h"
#import "AirPortDataBase.h"
#import "AirPortDataBaseSingleton.h"
#import "IsLoginInSingle.h"
#import "LogViewController.h"
#import "DetailFlightConditionViewController.h"
#import "AirCompanyDataBase.h"
#import "CityDataBase_David.h"
@implementation AppDelegate
@synthesize window=_window,viewController = _viewController;
@synthesize sinaweibo;
@synthesize justWeibo;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
//    [CityDataBase_David initDataBase];
//    [CityDataBase_David findAllCitiesSortedInKeys];
    
//    [CityDataBase_David findAllDerectCities];
    
//  [AirCompanyDataBase initDataBase];
//  [AirCompanyDataBase findAllAirCompany];
    
    CCLog(@"****************************");
    CCLog(@"token  = %@",Default_Token_Value);
    CCLog(@"memberId = %@",Default_UserMemberId_Value);
    
    BOOL flag =Default_IsUserLogin_Value;
    
    CCLog(@"用户是否已经登录：%d",flag);
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    UINavigationController *nav =[[UINavigationController alloc] initWithRootViewController:self.viewController];
    
    
    [self performSelectorInBackground:@selector(initDataBaseInBackground) withObject:nil];
    
    [self performSelectorInBackground:@selector(getCityAndAirport) withObject:nil];

    
    
    self.window.rootViewController = nav;
    [nav release];
    [self.window makeKeyAndVisible];
    
    LogViewController *logViewC = [[LogViewController alloc] initWithNibName:@"LogViewController" bundle:nil];
    sinaweibo = [[SinaWeibo alloc] initWithAppKey:sinaWeiboAppKey appSecret:sinaWeiboAppSecret appRedirectURI:sinaWeiboAppRedirectURI andDelegate:logViewC];
    
    DetailFlightConditionViewController *detailView = [[DetailFlightConditionViewController alloc] initWithNibName:@"DetailFlightConditionViewController" bundle:nil];
    justWeibo = [[SinaWeibo alloc] initWithAppKey:sinaWeiboAppKey appSecret:sinaWeiboAppSecret appRedirectURI:sinaWeiboAppRedirectURI andDelegate:detailView];
    
    
    return YES;
}

- (void) getCityAndAirport{
    
    [NSThread sleepForTimeInterval:7];
    CCLog(@"function %s line=%d",__FUNCTION__,__LINE__);

    AirPortDataBaseSingleton *single = [AirPortDataBaseSingleton shareAirPortBaseData];
    
    [NSThread sleepForTimeInterval:5];
   
//    [AirPortDataBase findAllHotAirPorts];
//    [AirPortDataBase findAllCitiesAndAirPorts];
}


- (void) initDataBaseInBackground{
    
    CCLog(@"function %s line=%d",__FUNCTION__,__LINE__);
    [AirPortDataBase initDataBase];
    
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    CCLog(@"function %s line=%d",__FUNCTION__,__LINE__);
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
    CCLog(@"function %s line=%d",__FUNCTION__,__LINE__);
    
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:KEY_Default_IsUserLogin];
    [[NSUserDefaults standardUserDefaults] synchronize];
    IsLoginInSingle *single = [IsLoginInSingle shareLoginSingle];
    single.isLogin = NO;
    
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    NSLog(@"handurl is :%@",url);
    NSString *urlString = [NSString stringWithFormat:@"%@",url];
//    [WXApi handleOpenURL:url delegate:self];
    return [self.sinaweibo handleOpenURL:url];
}


@end
