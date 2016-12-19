//
//  Government.m
//  DZ10Notification
//
//  Created by Vasilii on 19.12.16.
//  Copyright © 2016 Vasilii Burenkov. All rights reserved.
//

#import "Government.h"


//задаем значение такое же как и переменная
NSString * const GovernmentTaXLevelDidChangeNotification=@"GovernmentTaXLevelDidChangeNotification";
NSString * const GovernmentSalaryDidChangeNotification=@"GovernmentSalaryDidChangeNotification";
NSString * const GovernmentPensionDidChangeNotification=@"GovernmentPensionDidChangeNotification";
NSString * const GovernmentAveragePriceDidChangeNotification=@"GovernmentAveragePriceDidChangeNotification";

NSString * const GovernmentTaXLevelUserInfoKey=@"GovernmentTaXLevelUserInfoKey";
NSString * const GovernmentSalaryUserInfoKey=@"GovernmentSalaryUserInfoKey";
NSString * const GovernmentPensionUserInfoKey=@"GovernmentPensionUserInfoKey";
NSString * const GovernmentAverageUserInfoKey=@"GovernmentAverageUserInfoKey";

// устатавливаем значения
@implementation Government
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.taxLevel=5;
        self.salary=1000;
        self.pension=500;
        self.averagePrice=10;
        
    }
    return self;
}
//переопределим сеттеры
-(void) setTaxLevel:(float)taxLevel
{
    _taxLevel=taxLevel;
    
    NSDictionary * dictionary=[NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey:GovernmentTaXLevelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentTaXLevelDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
    
}

-(void) setSalary:(float)salary{
    _salary=salary;
    NSDictionary * dictionary=[NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:GovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
    
}

-(void) setPension:(float)pension{
    _pension=pension;
    
    NSDictionary * dictionary=[NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension] forKey:GovernmentPensionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
    
    
}

-(void) setAveragePrice:(float)averagePrice{
    _averagePrice=averagePrice;
    
    NSDictionary * dictionary=[NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey:GovernmentAverageUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
    
}


@end
