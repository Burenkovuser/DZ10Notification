//
//  AppDelegate.m
//  DZ10Notification
//
//  Created by Vasilii on 19.12.16.
//  Copyright © 2016 Vasilii Burenkov. All rights reserved.
//

#import "AppDelegate.h"
#import "Government.h"
#import "Doctor.h"
#import "Pensioner.h"
#import "Bussinesman.h"

@interface AppDelegate ()
@property (strong,nonatomic) Government* government;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //класс нотификайшин центр
    NSNotificationCenter * ns=[NSNotificationCenter defaultCenter];
    
    self.government= [[Government alloc] init];
    
    /*[[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(governmentNotification:)
                                                 name:GovernmentTaXLevelDidChangeNotification
                                               object:nil];*/
    
    Doctor *doctor1=[[Doctor alloc]init];
    Doctor *doctor2=[[Doctor alloc]init];
    Pensioner *pensioner1=[[Pensioner alloc]init];
    Pensioner *pensioner2=[[Pensioner alloc]init];
    Bussinesman *bussnesmam1=[[Bussinesman alloc]init];
    Bussinesman *bussnesmam2=[[Bussinesman alloc]init];
   // Doctor *doctor7=[[Doctor alloc]init];
    
    // устанавливаем одно значение зарплаты для докторов
    doctor1.salary=doctor2.salary=self.government.salary;
    
    pensioner1.pension = pensioner2.pension = self.government.pension;
    
    bussnesmam1.taXLeve = bussnesmam2.taXLeve = self.government.taxLevel;
    
    doctor1.averagePrice = doctor2.averagePrice = pensioner1.averagePrice = pensioner2.averagePrice = bussnesmam1.averagePrice = bussnesmam2.averagePrice = self.government.averagePrice;
    
    //меняем значения (до этого переопределили сетеры у правительства)
    self.government.taxLevel=5.5;
    self.government.salary=1100;
    self.government.averagePrice=15;
    self.government.pension=550;
    //    NSLog(@"%@",TAGovernmentSalaryDidChangeNotification);
    self.government.salary=1050;
    self.government.pension = 500;
    self.government.taxLevel = 7.5;
    self.government.averagePrice = 40;
    
    self.government.salary=1150;
    self.government.salary=900;
    self.government.pension = 630;
    
    return YES;
}

// реализуем метод
-(void) governmentNotification: (NSNotification *) notification{
    NSLog(@"Government Notification:%@",notification.userInfo);
    
}
// реализуем метод удаления
-(void) dealloc{
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:TAGovernmentTaXLevelDidChangeNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
