#
#  Be sure to run `pod spec lint GenUtilsLib.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

spec.name         = "GenUtilsLib"
spec.version      = "0.0.3"
spec.summary      = "Description of GenUtilsLib which does basic math functions, Dynamic height and width functions."

spec.description  = <<-DESC
This CocoaPods library helps you perform calculation like addition, subtraction, multiplication and division.

API's to get the dynamic width and height of screen for the required percentage.

API's to convert date to various formats and type
Get day string in format:dd MMM, YYYY  for given time in millis
Get Time string in format:1 day, 2 days, 1 hour, 2 hours, 1 min, 2 mins, 1 mon, 10 mon
Get Time string to show in sms/messenger time stamp in format:1 day, 2 days,1 mon, 10 mon or hh:mm (within 24 hours)
Get current time in format: hh:mm
Extension of Date to get values for each param in date for year, months, weeks, days, hours, minutes, seconds. And convert date to ical style UTC, to string format: dd MMM yyyy, to day number format: dd, to week number format: EE, to time format with am/pm: HH:mm a, to Milliseconds
DESC

spec.homepage     = "https://github.com/virtplay/GenUtilsLib"
spec.license      = { :type => "MIT", :file => "LICENSE" }
spec.author       = { "Karthik" => "kokarbs@gmail.com" }

spec.ios.deployment_target = "11.3"
spec.swift_version = "4.2"

spec.source        = { :git => "https://github.com/virtplay/GenUtilsLib.git", :tag => "#{spec.version}" }
spec.source_files  = "GenUtilsLib/**/*.swift"

end
