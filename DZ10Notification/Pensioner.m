//
//  Pensioner.m
//  DZ10Notification
//
//  Created by Vasilii on 19.12.16.
//  Copyright © 2016 Vasilii Burenkov. All rights reserved.
//

#import "Pensioner.h"
#import "Government.h"

@implementation Pensioner

#pragma mark - Initialization

//подписываем на нотификацию
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter *ns=[NSNotificationCenter defaultCenter];
        [ns  addObserver:self selector:@selector(pensionChangeNotification:) name:GovernmentPensionDidChangeNotification object:nil];
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
-(void) pensionChangeNotification: (NSNotification*) notification{
    NSNumber * value=[notification.userInfo objectForKey:GovernmentPensionUserInfoKey];
    
    float pension = [value floatValue];
    
    NSLog(@"Pensioner are %@ happy. Old pension: %@, New pension: %@",(self.pension<pension)?@"":@"NOT",@(self.pension),@(pension));
    self.pension=pension;
    
}
-(void) averagePriceNotification: (NSNotification*) notification{
    
    NSNumber * value=[notification.userInfo objectForKey:GovernmentAverageUserInfoKey];
    
    float averagePrice =[value floatValue];
    
    NSLog(@"Pensioner are %@ happy. Old price: %@, New price: %@",(self.averagePrice>averagePrice)?@"":@"NOT",@(self.averagePrice),@(averagePrice));
    self.averagePrice = averagePrice;

    
}

@end
