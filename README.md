# HKDateManager
This is useful to convert NSDate into String. If we have to show current date or any particular date in iOS application UI then we can use this for the same.

Hi Folks, You can use HKDateManager class manully into your code and call class methods diretly into you code for get your desire format date string.

Below are method into DateManagerClas, which are useful to convert NSDate into String. 

   
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
    
    
How to use class methods into your code.

   let stringDateFormServer:String = "2018-07-04T15:25:04Z"      
   let dateToShowOnUI:String =  DateManager.methodStringFromDate(dateFromString: DateManager.methodDateFromString(stringDate:    stringDateFormServer) as NSDate)

Happy Coding Folks.

