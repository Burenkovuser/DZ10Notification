//
//  Doctor.m
//  DZ10Notification
//
//  Created by Vasilii on 19.12.16.
//  Copyright © 2016 Vasilii Burenkov. All rights reserved.
//

#import "Doctor.h"
#import "Government.h"

@implementation Doctor

#pragma mark - Initialization

//подписываем на нотификацию
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter *ns=[NSNotificationCenter defaultCenter];
        [ns  addObserver:self selector:@selector(salaryChangeNotification:) name:GovernmentSalaryDidChangeNotification object:nil];
        [ns addObserver:self selector:@selector(averagePriceNotification:) name:GovernmentAveragePriceDidChangeNotification object:nil];
    }
    return self;
}
// отписываем от нотификации
-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
//обрабатываем нотификацию
#pragma mark - Notification
-(void) salaryChangeNotification: (NSNotification*) notification{
    NSNumber * value=[notification.userInfo objectForKey:GovernmentSalaryUserInfoKey];
    
    float salary=[value floatValue];
    
    NSLog(@"Doctor are %@ happy. Old salary: %@, New salary: %@",(self.salary<salary)?@"":@"NOT",@(self.salary),@(salary));
    self.salary=salary;
    
}
-(void) averagePriceNotification: (NSNotification*) notification{
    
    NSNumber * value=[notification.userInfo objectForKey:GovernmentAverageUserInfoKey];
    
    float averagePrice =[value floatValue];
    
    NSLog(@"Doctor are %@ happy. Old price: %@, New price: %@",(self.averagePrice>averagePrice)?@"":@"NOT",@(self.averagePrice),@(averagePrice));
    self.averagePrice = averagePrice;
}

@end
