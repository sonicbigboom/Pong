//
//  Vector.swift
//  Pong
//
//  Created by Sonic Bigboom on 5/10/19.
//  Copyright © 2019 "Real" Programming Club. All rights reserved.
//

import Foundation
import Darwin

//Vector Structure.
struct Vector {
    
    //Variables
    var x:Double
    var y:Double
    var magnitude: Double {
        return sqrt((x * x) + (y * y))
    }
    var angle: Double {
        get {
            var output:Double = 1
            if y == 0 {
                output = 90 + (x * 90)
            } else if x == 0 {
                output = y * 90
            } else if y > 0 {
                output = atan(y/x) * 180 / Double.pi
            } else if y < 0 {
                output = (atan(y/x) * 180 / Double.pi) + 180
            }
            return output
        }
        set(newAngle) {
            let tempMagnitude = magnitude
            x = cos(newAngle * Double.pi / 180) * tempMagnitude
            y = sin(newAngle * Double.pi / 180) * tempMagnitude
        }
    }
    
    //Initializers:
    //Initialize with x and y.
    init(_ x:Double, _ y:Double) {
        self.x = x
        self.y = y
    }
    
    //Functions:
    //Return the unit vector.
    func unitVector() -> Vector {
        let newX = x / magnitude
        let newY = y / magnitude
        return Vector(newX, newY)
    }
    //Convert to the unit vector.
    mutating func convertToUnitVector() {
        self = unitVector()
    }
    //Return vector magnitude based on new x value.
    func magnitudeFromX(_ x:Double) -> Double {
        return unitVector().y * ( x / unitVector().x)
    }
    //Convert vector based on new x value.
    mutating func convertFromX(_ x:Double) {
        self.y = magnitudeFromX(x)
        self.x = x
    }
    //Return vector magnitude based on new y value.
    func magnitudeFromY(_ y:Double) -> Double {
        return unitVector().x * ( y / unitVector().y)
    }
    //Convert vector based on new y value.
    mutating func convertFromY(_ y:Double) {
        self.x = magnitudeFromY(y)
        self.y = y
    }
    
    //Implement vector multiplication.
    static func *(lhs:Vector, rhs:Double) -> Vector {
        return Vector(lhs.x * rhs, lhs.y * rhs)
    }
    static func *(lhs:Double, rhs:Vector) -> Vector {
        return Vector(rhs.x * lhs, rhs.y * lhs)
    }
}


