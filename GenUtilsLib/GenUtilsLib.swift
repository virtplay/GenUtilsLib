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
        print("date: \(date)")
        
        let currentdate = Date(timeIntervalSinceNow: 0)
        let mins = currentdate.minutes(from: date)
        print("mins: \(mins)")
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
        print("date: \(date)")
        
        let currentdate = Date(timeIntervalSinceNow: 0)
        let mins = currentdate.minutes(from: date)
        print("mins: \(mins)")
        
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
