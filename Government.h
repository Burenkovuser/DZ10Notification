//
//  Government.h
//  DZ10Notification
//
//  Created by Vasilii on 19.12.16.
//  Copyright © 2016 Vasilii Burenkov. All rights reserved.
//

#import <Foundation/Foundation.h>


// создаем нотификации с уникальным именем (указатель на строку): название класса которые посылает нотификацию, собстенно суть названия и заканчивается Notification
extern NSString * const GovernmentTaXLevelDidChangeNotification;
extern NSString * const GovernmentSalaryDidChangeNotification;
extern NSString * const GovernmentPensionDidChangeNotification;
extern NSString * const GovernmentAveragePriceDidChangeNotification;

//применяется для ключа в словаре dictionary, приходящие значение будет лежать по этому ключу
extern NSString * const GovernmentTaXLevelUserInfoKey;
extern NSString * const GovernmentSalaryUserInfoKey;
extern NSString * const GovernmentPensionUserInfoKey;
extern NSString * const GovernmentAverageUserInfoKey;

@interface Government : NSObject

@property(assign,nonatomic) float taxLevel;
@property(assign,nonatomic) float salary;
@property(assign,nonatomic) float pension;
@property(assign,nonatomic) float averagePrice;


@end
