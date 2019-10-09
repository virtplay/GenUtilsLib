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
    
    
}
