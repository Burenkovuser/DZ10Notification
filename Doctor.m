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
        //указатель на нотфикационный центр
        NSNotificationCenter *ns=[NSNotificationCenter defaultCenter];
        //объект который будет принмать уведомления
        [ns  addObserver:self
         //метод который будет вызван в момент приемки уведомления
                selector:@selector(salaryChangeNotification:)
         //имя уведомления
                    name:GovernmentSalaryDidChangeNotification
         //объект который отправил уведомление
                  object:nil];
        
        [ns addObserver:self
               selector:@selector(averagePriceNotification:)
                   name:GovernmentAveragePriceDidChangeNotification
                 object:nil];
    }
    return self;
}
// отписываем от нотификации самого себя
-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
//обрабатываем нотификацию (реализуем методы)
#pragma mark - Notification
-(void) salaryChangeNotification: (NSNotification*) notification{
    // хотим узнать у правительства какая сейчас новая зарплата из словаря по ключу
    NSNumber * value=[notification.userInfo objectForKey:GovernmentSalaryUserInfoKey];
   //установим значение зарплаты
    float salary=[value floatValue];
    // тернарный оператор
    NSLog(@"Doctor are %@ happy. Old salary: %@, New salary: %@",(self.salary<salary)?@"":@"NOT",@(self.salary),@(salary));
     //изменяем свою зарплату на новую что пришла по нотификации
    self.salary=salary;
    
}
-(void) averagePriceNotification: (NSNotification*) notification{
    
    NSNumber * value=[notification.userInfo objectForKey:GovernmentAverageUserInfoKey];
    
    float averagePrice =[value floatValue];
    
    NSLog(@"Doctor are %@ happy. Old price: %@, New price: %@",(self.averagePrice>averagePrice)?@"":@"NOT",@(self.averagePrice),@(averagePrice));
    self.averagePrice = averagePrice;
}

@end
