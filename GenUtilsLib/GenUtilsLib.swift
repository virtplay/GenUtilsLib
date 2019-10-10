//
//  GenUtilsLib.swift
//  GenUtilsLib
//
//  Created by Karthik on 27/09/19.
//  Copyright © 2019 Moback. All rights reserved.
//

import Foundation


public final class GenUtilsLib {
    
    let name = "GenUtilsLib"
    
    public init() {}
    
    // Basic Math functions
    public func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    public func sub(a: Int, b: Int) -> Int {
        return a - b
    }
    
    public func multiply(a: Int, b: Int) -> Int {
        return a * b
    }
    
    public func divide(a: Int, b: Int) -> Int {
        return a / b
    }
    
    // Get dynamic width and height for required percentage of actual screen.
    public func getWidthFor(percent:Float)-> Float{
        let screenWidth =  Float(UIScreen.main.bounds.width) * (percent/100)
        return screenWidth
    }
    
    public func getHeightFor(percent:Float)->Float{
        let screenHeight =  Float(UIScreen.main.bounds.height) * (percent/100)
        return screenHeight
    }
    
    public func getWidthForPercentNReturnInt(percent:Float)-> Int{
        let screenWidth =  Float(UIScreen.main.bounds.width) * (percent/100)
        return Int(screenWidth)
    }
    
    public func getHeightForPercentNReturnInt(percent:Float)->Int{
        let screenHeight =  Float(UIScreen.main.bounds.height) * (percent/100)
        return Int(screenHeight)
    }
    
    // Get day string in format:dd MMM, YYYY  for given time in millis
    public func getDay(time:Int) -> String {
        let date = Date(timeIntervalSince1970:  Double(time/1000))
        let dayTimePeriodFormatter = DateFormatter()
        //        dayTimePeriodFormatter.dateFormat = "dd MMM, YYYY hh:mm a"
        dayTimePeriodFormatter.dateFormat = "dd MMM, YYYY"
        
        let timeString = dayTimePeriodFormatter.string(from: date as Date)
        return timeString
    }
    
    // Get Time string in format:1 day, 2 days, 1 hour, 2 hours, 1 min, 2 mins, 1 mon, 10 mon
    public func getTime(time:Int) -> String {
        
        let date = Date(timeIntervalSince1970: Double(time/1000))
//        print("date: \(date)")
        
        let currentdate = Date(timeIntervalSinceNow: 0)
        let mins = currentdate.minutes(from: date)
//        print("mins: \(mins)")
        if(mins>60){
            let hours = currentdate.hours(from: date)
            if(hours>24){
                let days = currentdate.days(from: date)
                if(days>30){
                    let months = currentdate.months(from: date)
                    return "\(months) mon"
                    
                }else{
                    if(days == 1){
                        return "1 day"
                    }else{
                        return "\(days) days"
                    }
                }
            }else{
                if(hours == 1){
                    return "1 hour"
                }else{
                    return "\(hours) hrs"
                }
            }
        }else{
            if(mins == 1){
                return "1 min"
            }else{
                return "\(mins) mins"
            }
        }
    }
    
    // Get Time string to show in sms/messenger time stamp in format:1 day, 2 days,1 mon, 10 mon or hh:mm (within 24 hours)
    public func getTimeForMessage(time:Int) -> String {
        
        let date = Date(timeIntervalSince1970: Double(time/1000))
//        print("date: \(date)")
        
        let currentdate = Date(timeIntervalSinceNow: 0)
        let mins = currentdate.minutes(from: date)
//        print("mins: \(mins)")

        let hours = currentdate.hours(from: date)
        if(hours>24){
            let days = currentdate.days(from: date)
            if(days>30){
                let months = currentdate.months(from: date)
                return "\(months) mon"
                
            }else{
                if(days == 1){
                    return "1 day"
                }else{
                    return "\(days) days"
                }
            }
        }else{
            
            let dayTimePeriodFormatter = DateFormatter()
            //        dayTimePeriodFormatter.dateFormat = "dd MMM, YYYY hh:mm a"
            dayTimePeriodFormatter.dateFormat = "hh:mm"
            
            let timeString = dayTimePeriodFormatter.string(from: date as Date)
            return timeString
        }
        
    }
    
    // Get current time in format: hh:mm
    public func getCurrentTime() -> String {
        let currentdate = Date(timeIntervalSinceNow: 0)
        let dayTimePeriodFormatter = DateFormatter()
        //        dayTimePeriodFormatter.dateFormat = "dd MMM, YYYY hh:mm a"
        dayTimePeriodFormatter.dateFormat = "hh:mm"
        
        let timeString = dayTimePeriodFormatter.string(from: currentdate as Date)
        return timeString
    }
    
    
}


/*
 * Extension of Date to get values for each param in date for year, months, weeks, days, hours, minutes, seconds. And convert date to ical style UTC, to string format: dd MMM yyyy, to day number format: dd, to week number format: EE, to time format with am/pm: HH:mm a, to Milliseconds
 */
extension Date {
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date)) mon"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date)) day"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date)) min" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
    
    // To convert date to ical style UTC string format
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss'Z'"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        let dateStr = dateFormatter.string(from: self)
        return dateStr
    }
    
    // To convert date to string format: dd MMM yyyy
    func toDateString() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        let dateStr = dateFormatter.string(from: self)
        return dateStr
    }
    
    // To convert date to day number format: dd
    func toDayNumString() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        let dateStr = dateFormatter.string(from: self)
        return dateStr
    }
    
    // To convert date to week number format: EE
    func toDayWeekString() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        let dateStr = dateFormatter.string(from: self)
        return dateStr
    }
    
    // To convert date to time format with am/pm: HH:mm a
    func toTimeString() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        let dateStr = dateFormatter.string(from: self)
        return dateStr
    }
    
    // Converts date to Milliseconds usage Eg: Date().millisecondsSince1970 // 1476889390939
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
}

// Extension UIButton for text with indent space
extension UIButton{
    func setAttributedStrWithSpace(kernValue:Double = 1.0){
        if let labelText = titleLabel?.text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
            setAttributedTitle(attributedString, for: self.state)
        }
    }
}

// Extension UILabel for text with indent space
extension UILabel {
    func setAttributedStrWithSpace(kernValue: Double = 1.0) {
        if let labelText = text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}

extension Int {
    
    // convert given number to str format : 1K, 4M, 9B
    func convertToMetric () -> String {
        let numFormatter = NumberFormatter()
        
        typealias Abbrevation = (threshold:Double, divisor:Double, suffix:String)
        let abbreviations:[Abbrevation] = [(0, 1, ""),
                                           (1000.0, 1000.0, "K"),
                                           (100_000.0, 1_000_000.0, "M"),
                                           (100_000_000.0, 1_000_000_000.0, "B")]
        // you can add more !
        
        let startValue = Double (abs(self))
        let abbreviation:Abbrevation = {
            var prevAbbreviation = abbreviations[0]
            for tmpAbbreviation in abbreviations {
                if (startValue < tmpAbbreviation.threshold) {
                    break
                }
                prevAbbreviation = tmpAbbreviation
            }
            return prevAbbreviation
        } ()
        
        let value = Double(self) / abbreviation.divisor
        numFormatter.positiveSuffix = abbreviation.suffix
        numFormatter.negativeSuffix = abbreviation.suffix
        numFormatter.allowsFloats = true
        numFormatter.minimumIntegerDigits = 1
        numFormatter.minimumFractionDigits = 0
        numFormatter.maximumFractionDigits = 1
        
        return numFormatter.string(from: NSNumber (value:value))!
    }
    
    // convert given number to str format : to get result with fractions : 1.4K, 5.8M...
    func convertToMetricWithOutFraction () -> String {
        let numFormatter = NumberFormatter()
        
        typealias Abbrevation = (threshold:Double, divisor:Double, suffix:String)
        let abbreviations:[Abbrevation] = [(0, 1, ""),
                                           (1000.0, 1000.0, "K"),
                                           (100_000.0, 1_000_000.0, "M"),
                                           (100_000_000.0, 1_000_000_000.0, "B")]
        // you can add more !
        
        let startValue = Double (abs(self))
        let abbreviation:Abbrevation = {
            var prevAbbreviation = abbreviations[0]
            for tmpAbbreviation in abbreviations {
                if (startValue < tmpAbbreviation.threshold) {
                    break
                }
                prevAbbreviation = tmpAbbreviation
            }
            return prevAbbreviation
        } ()
        
        let value = Double(self) / abbreviation.divisor
        numFormatter.positiveSuffix = abbreviation.suffix
        numFormatter.negativeSuffix = abbreviation.suffix
        numFormatter.allowsFloats = true
        numFormatter.minimumIntegerDigits = 1
        numFormatter.minimumFractionDigits = 0
        numFormatter.maximumFractionDigits = 0 // Change this for fraction value
        
        return numFormatter.string(from: NSNumber (value:value))!
    }
    
    // Get only type of metric string for given number: Thousand, Million, Billion
    func convertToMetricStr() -> String {
        let alphabet = String(convertToMetric().last!)
        switch alphabet {
        case "K":
            return "Thousand"
        case "M":
            return "Million"
        case "B":
            return "Billion"
        default:
            return ""
        }
    }
    
}

extension String {
    
    func fileName() -> String {
        return NSURL(fileURLWithPath: self).deletingPathExtension?.lastPathComponent ?? ""
    }
    
    func fileExtension() -> String {
        return NSURL(fileURLWithPath: self).pathExtension ?? ""
    }
    
    /// TODO add documentation
    func toKeyValuePair(splittingOn separator: Character) -> (first: String, second: String)? {
        let arr = self.split(separator: separator,
                             maxSplits: 1,
                             omittingEmptySubsequences: false)
        if arr.count < 2 {
            return nil
        } else {
            return (String(arr[0]), String(arr[1]))
        }
    }
    
    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd'T'HHmmssZ"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        //        dateFormatter.dateFormat = "dd MMM yyyy"
        
        return dateFormatter
    }()
    
    /// Convert String to Date for calendar in format
    func toDateString() -> String? {
        let date = String.dateFormatter.date(from: self) // complete Date
        print("1. date: \(date)")
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: date!)
    }
    
    func toDayNumString() -> String? {
        let date = String.dateFormatter.date(from: self) // complete Date
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter.string(from: date!)
    }
    
    func toDayWeekString() -> String? {
        let date = String.dateFormatter.date(from: self) // complete Date
        let formatter = DateFormatter()
        formatter.dateFormat = "EE"
        return formatter.string(from: date!)
    }
    
    func toTimeString() -> String? {
        let date = String.dateFormatter.date(from: self) // complete Date
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter.string(from: date!)
    }
    
    func toDate() -> Date? {
        //        print("Date before here: \(self)")
        let date = String.dateFormatter.date(from: self) // complete Date
        print("Date here: \(String(describing: date))")
        return date
    }
    
    //    func toStringForDTSTART() -> String? {
    //        var start = String.Index(encodedOffset: 0)
    //        var end = String.Index(encodedOffset: 3)
    //        let yearString = String(self[start...end])
    //
    //        print("yearstr: \(yearString)")
    //
    //        start = String.Index(encodedOffset: 4)
    //        end = String.Index(encodedOffset: 5)
    //        let monthString = String(self[start...end])
    //
    //        print("yearstr: \(yearString)")
    //
    //        start = String.Index(encodedOffset: 6)
    //        end = String.Index(encodedOffset: 7)
    //        let dayString = String(self[start...end])
    //
    //        var monthStringIn3Letters:String?
    //        switch monthString {
    //        case "01":monthStringIn3Letters = "JAN"
    //        case "02":monthStringIn3Letters = "FEB"
    //        case "03":monthStringIn3Letters = "MAR"
    //        case "04":monthStringIn3Letters = "APR"
    //        case "05":monthStringIn3Letters = "MAY"
    //        case "06":monthStringIn3Letters = "JUN"
    //        case "07":monthStringIn3Letters = "JUL"
    //        case "08":monthStringIn3Letters = "AUG"
    //        case "09":monthStringIn3Letters = "SEP"
    //        case "10":monthStringIn3Letters = "OCT"
    //        case "11":monthStringIn3Letters = "NOV"
    //        case "12":monthStringIn3Letters = "DEC"
    //        default:
    //            monthStringIn3Letters = ""
    //        }
    //        return "\(dayString) \(monthStringIn3Letters!) \(yearString)"
    //
    //    }
    
}
