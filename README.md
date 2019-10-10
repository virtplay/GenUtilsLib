# GenUtilsLib . [![Build Status](https://travis-ci.org/virtplay/GenUtilsLib.svg?branch=master)](https://travis-ci.org/virtplay/GenUtilsLib)
General utility methods for application easy usage.

This is a library which provides APIs for general methods/functionalities which are majorly used in IOS applications.

Installation:
GenUtilsLib library is available through CocoaPods. To install it, simply add the following line to your Podfile:
        pod 'GenUtilsLib'


Usage set 1:

        let genUtilsLib = GenUtilsLib()
        
        let currentTime = genUtilsLib.getCurrentTime()
        print("current time: \(currentTime)")
        
        print("2 + 5 is \(genUtilsLib.add(a: 2, b: 5))\n 5 - 2 is \(genUtilsLib.sub(a: 5, b: 2))\n 2 * 5 is \(genUtilsLib.multiply(a: 2, b: 5))\n 5 / 2 is \(genUtilsLib.divide(a: 5, b: 2))")
        
        print("Get height for percent 23: \(genUtilsLib.getHeightFor(percent: 23))")
        print("Get height for percent 23 in integer: \(genUtilsLib.getHeightForPercentNReturnInt(percent: 23))")
        print("Get width for percent 23: \(genUtilsLib.getWidthFor(percent: 23))")
        print("Get width for percent 23 in integer: \(genUtilsLib.getWidthForPercentNReturnInt(percent: 23))")
        
        let dateint:Int = Int(Date().timeIntervalSince1970 * 1000) - 68000
        print("Get day from the given date:\(genUtilsLib.getDay(time: dateint))")
        
        print("Get time from the given date:\(genUtilsLib.getTime(time: dateint))")
        print("Get time from the given date for messenger/sms usage format:\(genUtilsLib.getTimeForMessage(time: dateint))")
        
        
Sample Output 1:

        current time: 11:45
        2 + 5 is 7
        5 - 2 is 3
        2 * 5 is 10
        5 / 2 is 2
        Get height for percent 23: 206.08
        Get height for percent 23 in integer: 206
        Get width for percent 23: 95.22
        Get width for percent 23 in integer: 95
        Get day from the given date:10 Oct, 2019
        Get time from the given date:1 min
        Get time from the given date for messenger/sms usage format:11:44
        
        
Usage set 2:

        // To convert date to string format: dd MMM yyyy
        let sampleDate = Date()
        
        let lastYearDate = Calendar.current.date(byAdding: .year, value: -2, to: Date())
        let lastMonthDate = Calendar.current.date(byAdding: .month, value: -2, to: Date())
        let lastDaysDate = Calendar.current.date(byAdding: .day, value: -2, to: Date())
        let lastHoursDate = Calendar.current.date(byAdding: .hour, value: -3, to: Date())
        let lastWeeksDate = Calendar.current.date(byAdding: .weekOfMonth, value: -2, to: Date())
        let lastMinsDate = Calendar.current.date(byAdding: .minute, value: -3, to: Date())
        let lastSecondsDate = Calendar.current.date(byAdding: .second, value: -3, to: Date())
        
        
        let yrsStr = sampleDate.years(from: lastYearDate!)
        print("years from date to date: \(yrsStr)")
        
        let monthStr = sampleDate.months(from: lastMonthDate!)
        print("months from date to date: \(monthStr)")
        
        let daysStr = sampleDate.days(from: lastDaysDate!)
        print("days from date to date: \(daysStr)")
        
        let hoursStr = sampleDate.hours(from: lastHoursDate!)
        print("hours from date to date: \(hoursStr)")
        
        let weeksStr = sampleDate.weeks(from: lastWeeksDate!)
        print("weeks from date to date: \(weeksStr)")
        
        let minsStr = sampleDate.minutes(from: lastMinsDate!)
        print("minutes from date to date: \(minsStr)")
        
        let secsStr = sampleDate.seconds(from: lastSecondsDate!)
        print("seconds from date to date: \(secsStr)")
        
        // To convert date to string format: dd MMM yyyy
        let str = sampleDate.toDateString()
        print("Sample date to string conversion: \(str!)")
        
        // To convert date to ical style with UTC zone
        print("convert date to ical style with utc zone string: \(sampleDate.toString())")
        print("convert date to day number string: \(sampleDate.toDayNumString()!)")
        print("convert date to time string: \(sampleDate.toTimeString()!)")
        print("convert date to day in week string: \(sampleDate.toDayWeekString()!)")
        
        
Sample Output 2:

        years from date to date: 1
        months from date to date: 1
        days from date to date: 1
        hours from date to date: 2
        weeks from date to date: 1
        minutes from date to date: 2
        seconds from date to date: 2
        Sample date to string conversion: 10 Oct 2019
        convert date to ical style with utc zone string: 20191010T130757Z
        convert date to day number string: 10
        convert date to time string: 13:07 PM
        convert date to day in week string: Thu
        
        
Usage set 3:

        // To convert string(having date) in ical style to other formats date/strings
        let dateStr = sampleDate.toString()
        print("convert string(having date) to Date:\(dateStr.toDate()!)")
        print("convert string(having date) to day in week string:\(dateStr.toDayWeekString()!)")
        print("convert string(having date) to time string:\(dateStr.toTimeString()!)")
        print("convert string(having date) to day number string:\(dateStr.toDayNumString()!)")
        print("convert string(having date) to date string:\(dateStr.toDateString()!)")
        
        // Convert date to millis
        print("Convert string(having date) to date in millis: \(sampleDate.millisecondsSince1970)")
        
        // To get file name and extension having filepath string
        let filepath = "/var/mobile/Containers/Data/Application/29306029-BDCF-4BEA-93A6-D5626CBAAA90/Documents/x.jpg"
        print("Filename from absolute path: \(filepath.fileName())")
        print("File extension from absolute path: \(filepath.fileExtension())")
        
Sample Output 3:
        
        convert string(having date) to Date:2019-10-10 13:07:57 +0000
        convert string(having date) to day in week string:Thu
        convert string(having date) to time string:01:07 PM
        convert string(having date) to day number string:10
        convert string(having date) to date string:10 Oct 2019
        Convert string(having date) to date in millis: 1570712877951
        Filename from absolute path: x
        File extension from absolute path: jpg
        
