//
//  DateUtil.swift
//  cybilltek_sanpedro_christiann
//
//  Created by Christiann Carlos San Pedro on 14/02/2018.
//  Copyright © 2018 Christiann Carlos San Pedro. All rights reserved.
//

import UIKit

class DateUtil: NSObject {
  
  /*
 + (NSString *)formatDateWithString:(NSString *)strDate
 {
 NSDateFormatter *format = [[NSDateFormatter alloc] init];
 
 format.dateFormat = @"yyyy-MM-dd";
 NSDate *date = [format dateFromString:strDate];
 
 
 [format setDateStyle:NSDateFormatterLongStyle];
 [format setTimeStyle:NSDateFormatterNoStyle];
 
 return [format stringFromDate:date];
 }
 
U*/
  
//  class func formateDateWithString:
  
 class func getDateOf(_ date:String, withFormat format:String) -> Date{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    let newDate = dateFormatter.date(from: date)
  
  return newDate!
//    dateFormatter.dateFormat = "MMMM dd,YYYY"
//    let strDate = dateFormatter.string(from: newDate!)
//    return strDate
//    let date:NSDate? = dateFormatter.dateFromString
  }
  
 class func calculateAge(Of date:Date) -> Int {
    let now = Date()
    let birthday: Date = date
    let calendar = Calendar.current
    
    let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
    let age = ageComponents.year!
    return age
  }

}
