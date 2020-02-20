//
//  main.m
//  employeedatabase
//
//  Created by xcode on 12/28/19.
//  Copyright © 2019 xcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"

void printDirections()
{
    NSLog(@"You will be prompted to enter employee information in order to add them to the database.");
    NSLog(@"Once an employee is added to the databse, you will be able to edit their information or delete them from the database.");
    NSLog(@"You may add as many employees as you would like whenever you would like to do so.");
    NSLog(@"Press enter to continue");
    getchar();
}

void createEmployee(NSMutableArray *employees, NSMutableArray *employeeList, int employeeCownt)
{
    Employee *employee = [[Employee alloc]init];
    char firstName[50] = {0};
    char lastName[50] = {0};
    int idNum = 0;
    int internalID = employeeCownt - 1;
    double salary = 0.0;
    int isEmployed = 0;
    NSString* employeeFirstName;
    NSString* employeeLastName;
    NSString* stringHireDate;
    NSString* year;
    NSString* month;
    NSString* day;
    char monthOfHire[2] = {0};
    char dayOfHire[2] = {0};
    char yearOfHire[4] = {0};
    
    NSLog(@"Please enter the employees first name: ");
    scanf("%s", firstName);
    employeeFirstName = [NSString stringWithUTF8String: firstName];
    NSLog(@"Please enter the employees last name: ");
    scanf("%s", lastName);
    employeeLastName = [NSString stringWithUTF8String: lastName];
    NSLog(@"Please enter the employee's id number: ");
    scanf("%i", &idNum);
    NSLog(@"Please enter the year the employee was hired (4 digits): ");
    scanf("%s", yearOfHire);
    year = [NSString stringWithUTF8String: yearOfHire];
    NSLog(@"Please enter the month the employee was hired (2 digits): ");
    scanf("%s", monthOfHire);
    month = [NSString stringWithUTF8String: monthOfHire];
    NSLog(@"Please enter the day the employee was hired (2 digits): ");
    scanf("%s", dayOfHire);
    day = [NSString stringWithUTF8String: dayOfHire];
    stringHireDate = [NSString stringWithFormat:@"%s-%s-%s 09:00:00 -800", yearOfHire, monthOfHire, dayOfHire];
    NSLog(@"Please enter the employee's salary: ");
    scanf("%lf", &salary);
    NSLog(@"Please enter 0 if the employee is no longer working for the company or 1 if the employee is still active for the company: ");
    scanf("%i", &isEmployed);
    
    [employee setFirstName: employeeFirstName];
    [employee setLastName: employeeLastName];
    [employee setIdNum: idNum];
    [employee setHireDate:[NSDate dateWithString:stringHireDate]];
    [employee setSalary: salary];
    [employee setIsEmployed: isEmployed];
    [employee setInternalID: internalID];
    [employees addObject: employee];
    [employeeList addObject:employee];
}
 
void viewEmployees(NSMutableArray *employees, int employeeCownt)
{
    for(int i = 0; i < employeeCownt; i++)
    {
        NSLog(@"Internal ID Number: %i",[employees[i] internalID]);
        NSLog(@"First name: %@", [employees[i] firstName]);
        NSLog(@"Last name: %@", [employees[i] lastName]);
        NSLog(@"Employee ID Number: %i", [employees[i] idNum]);
        NSLog(@"Hire Date: %@", [employees[i] hireDate]);
        NSLog(@"Salary: %lf",[employees[i] salary]);
        if([employees[i] isEmployed] == 1)
        {
            NSLog(@"Is currently employed: Yes");
        }
        else
        {
            NSLog(@"Is currently employed: No");
        }
    }
}

void editEmployee(NSMutableArray *employees, NSMutableArray *employeeList, int employeeCownt)
{
    int userInput = 0;
    int internalIDTracker = 0;
    char firstName[50] = {0};
    char lastName[50] = {0};
    int idNum = 0;
    double salary = 0.0;
    int isEmployed = 0;
    NSString* employeeFirstName;
    NSString* employeeLastName;
    NSString* stringHireDate;
    NSString* year;
    NSString* month;
    NSString* day;
    char monthOfHire[2] = {0};
    char dayOfHire[2] = {0};
    char yearOfHire[4] = {0};
    
    for(int i = 0; i < employeeCownt; i++)
    {
        NSLog(@"Internal ID Number: %i",[employees[i] internalID]);
        NSLog(@"First name: %@", [employees[i] firstName]);
        NSLog(@"Last name: %@", [employees[i] lastName]);
    }
    NSLog(@"Enter the internal id that you wish to edit the record for: ");
    scanf("%i", &internalIDTracker);
    
    NSLog(@"Internal ID Number: %i",[employees[internalIDTracker] internalID]);
    NSLog(@"First name: %@", [employees[internalIDTracker] firstName]);
    NSLog(@"Last name: %@", [employees[internalIDTracker] lastName]);
    NSLog(@"Employee ID Number: %i", [employees[internalIDTracker] idNum]);
    NSLog(@"Hire Date: %@", [employees[internalIDTracker] hireDate]);
    NSLog(@"Salary: %lf",[employees[internalIDTracker] salary]);
    if([employees[internalIDTracker] isEmployed] == 1)
    {
        NSLog(@"Is currently employed: Yes");
    }
    else
    {
        NSLog(@"Is currently employed: No");
    }
    NSLog(@"Enter 1 to change the employee's first name");
    NSLog(@"Enter 2 to change the employee's last name");
    NSLog(@"Enter 3 to change the employee's id number");
    NSLog(@"Enter 4 to change the employee's hire date");
    NSLog(@"Enter 5 to change the employee's salary");
    NSLog(@"Enter 6 to change the employment status of the employee");
    scanf("%i", &userInput);
            
    switch(userInput)
    {
        case 1:
            NSLog(@"Please enter the employees first name: ");
            scanf("%s", firstName);
            employeeFirstName = [NSString stringWithUTF8String: firstName];
            [employees[internalIDTracker] setFirstName: employeeFirstName];
            [employeeList[internalIDTracker] setFirstName: employeeFirstName];
            break;
        case 2:
            NSLog(@"Please enter the employees last name: ");
            scanf("%s", lastName);
            employeeLastName = [NSString stringWithUTF8String: lastName];
            [employees[internalIDTracker] setLastName: employeeLastName];
            [employeeList[internalIDTracker] setLastName: employeeLastName];
            break;
        case 3:
            NSLog(@"Please enter the employee's id number: ");
            scanf("%i", &idNum);
            [employees[internalIDTracker] setIdNum: idNum];
            [employeeList[internalIDTracker] setIdNum: idNum];
            break;
        case 4:
            NSLog(@"Please enter the year the employee was hired (4 digits): ");
            scanf("%s", yearOfHire);
            year = [NSString stringWithUTF8String: yearOfHire];
            NSLog(@"Please enter the month the employee was hired (2 digits): ");
            scanf("%s", monthOfHire);
            month = [NSString stringWithUTF8String: monthOfHire];
            NSLog(@"Please enter the day the employee was hired (2 digits): ");
            scanf("%s", dayOfHire);
            day = [NSString stringWithUTF8String: dayOfHire];
            stringHireDate = [NSString stringWithFormat:@"%s-%s-%s 09:00:00 -800", yearOfHire, monthOfHire, dayOfHire];
            [employees[internalIDTracker] setHireDate:[NSDate dateWithString:stringHireDate]];
            break;
        case 5:
            NSLog(@"Please enter the employee's salary: ");
            scanf("%lf", &salary);
            [employees[internalIDTracker] setSalary: salary];
            [employeeList[internalIDTracker] setSalary: salary];
            break;
        case 6:
            NSLog(@"Please enter 0 if the employee is no longer working for the company or 1 if the employee is still active for the company");
            scanf("%i", &isEmployed);
            [employees[internalIDTracker] setIsEmployed: isEmployed];
            [employeeList[internalIDTracker] setIsEmployed: isEmployed];
            break;
        default:
            NSLog(@"Error in switch updateEmployee");
            break;
    }
}

void deleteEmployee(NSMutableArray *employees, NSMutableArray *employeeList, int employeeCownt)
{
    int userInput = 0;
    
    for(int i = 0; i < employeeCownt; i++)
    {
        NSLog(@"Internal ID Number: %i",[employees[i] internalID]);
        NSLog(@"Name: %@", [employees[i] name]);
    }
    
    NSLog(@"Enter the employee's id that you wish to edit the record for: ");
    scanf("%i", &userInput);
    
    [employees removeObject:employees[userInput]];
    [employeeList removeObject:employeeList[userInput]];
}

void switchBoard()
{
    int userInput = 0;
    int employeeCownt = 0;
    NSMutableArray *employees = [[NSMutableArray alloc] init];
    NSMutableArray* employeeList = [[NSMutableArray alloc] init];
    
    printDirections();
    
    while((userInput < 1) || (userInput > 5))
    {
        NSLog(@"Enter 1 to add an employee");
        NSLog(@"Enter 2 to view all of the employees");
        NSLog(@"Enter 3 to change an employee's information");
        NSLog(@"Enter 4 to delete an employee");
        NSLog(@"Enter 5 to exit");
        scanf("%i", &userInput);
        
        switch (userInput)
        {
            case 1:
                employeeCownt++;
                createEmployee(employees, employeeList, employeeCownt);
                userInput = 0;
                [NSKeyedArchiver archiveRootObject:employeeList toFile:@"/Users/xcode/Documents/temp3.plist"];
                break;
            case 2:
                viewEmployees(employees, employeeCownt);
                userInput = 0;
                [NSKeyedArchiver archiveRootObject:employeeList toFile:@"/Users/xcode/Documents/temp3.plist"];
                break;
            case 3:
                editEmployee(employees, employeeList, employeeCownt);
                userInput = 0;
                [NSKeyedArchiver archiveRootObject:employeeList toFile:@"/Users/xcode/Documents/temp3.plist"];
                break;
            case 4:
                deleteEmployee(employees, employeeList, employeeCownt);
                employeeCownt--;
                userInput = 0;
                [NSKeyedArchiver archiveRootObject:employeeList toFile:@"/Users/xcode/Documents/temp3.plist"];
                break;
            case 5:
                exit(0);
            default:
                NSLog(@"Error in switch statement switchBoard()");
                exit(1);
                break;
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        switchBoard();
    }
    return 0;
}

//NSMutableArray* employeeList2 = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/xcode/Documents/temp3.plist"];
