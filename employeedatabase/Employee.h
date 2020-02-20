//
//  Employee.h
//  employeedatabase
//
//  Created by xcode on 1/9/20.
//  Copyright © 2020 xcode. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Employee : NSObject
@property int internalID;
@property NSString* firstName;
@property NSString* lastName;
@property int idNum;
@property NSDate* hireDate;
@property double salary;
@property int isEmployed;
@end

NS_ASSUME_NONNULL_END
