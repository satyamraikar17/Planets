//
//  AppDelegate.h
//  Planets
//
//  Created by iRohan on 09/01/19.
//  Copyright © 2019 satyamraikar17. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

