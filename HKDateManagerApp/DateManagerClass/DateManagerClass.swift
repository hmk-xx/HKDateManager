//
//  DateManagerClass.swift


import UIKit

class DateManagerClass: NSObject {

    class func methodDateFromString(stringDate:String,stringDateFormatter:String)->NSDate{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = stringDateFormatter

        let date = dateFormatter.date(from: stringDate)
        return date! as NSDate
    }
    
    class func methodStringFromDate(dateFromString:NSDate,stringDateFormatter:String )->String{

    let dateFormatter = DateFormatter()
    let tempLocale = dateFormatter.locale
    dateFormatter.dateFormat = stringDateFormatter
    dateFormatter.locale = tempLocale // reset the locale
    let dateString = dateFormatter.string(from: dateFromString as Date)
    
        return dateString
    }
}
