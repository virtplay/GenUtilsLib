#
#  Be sure to run `pod spec lint GenUtilsLib.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

spec.name         = "GenUtilsLib"
spec.version      = "0.0.1"
spec.summary      = "A short description of GenUtilsLib which does basic math functions."

spec.description  = <<-DESC
This CocoaPods library helps you perform calculation like addition, subtraction, multiplication and division.
DESC

spec.homepage     = "https://github.com/virtplay/GenUtilsLib"
spec.license      = { :type => "MIT", :file => "LICENSE" }
spec.author       = { "Karthik" => "kokarbs@gmail.com" }

spec.ios.deployment_target = "11.3"
spec.swift_version = "4.2"

spec.source        = { :git => "https://github.com/virtplay/GenUtilsLib.git", :tag => "#{spec.version}" }
spec.source_files  = "GenUtilsLib/**/*.swift"

end
