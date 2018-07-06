//
//  DateManagerClass.swift


import UIKit

class DateManagerClass: NSObject {

    class func methodDateFromString(stringDate:String,stringDateFormatter:String)->NSDate{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.dateFormat = stringDateFormatter

        let date = dateFormatter.date(from: stringDate)
        return date! as NSDate
    }
    
    class func methodStringFromDate(dateFromString:NSDate,stringDateFormatter:String )->String{

    let dateFormatter = DateFormatter()
    let tempLocale = dateFormatter.locale
//    dateFormatter.dateFormat = "MMMM dd yyyy HH:mm:ss"
    dateFormatter.dateFormat = stringDateFormatter
    dateFormatter.locale = tempLocale // reset the locale
    let dateString = dateFormatter.string(from: dateFromString as Date)
    
        return dateString
    }
}
