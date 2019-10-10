# GenUtilsLib . [![Build Status](https://travis-ci.org/virtplay/GenUtilsLib.svg?branch=master)](https://travis-ci.org/virtplay/GenUtilsLib)
General utility methods for application easy usage.

This is a library which provides APIs for general methods/functionalities which are majorly used in IOS applications.

Installation:
GenUtilsLib library is available through CocoaPods. To install it, simply add the following line to your Podfile:
        pod 'GenUtilsLib'


Usage:

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
        
        
Sample Output:

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
