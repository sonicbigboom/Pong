//
//  Vector.swift
//  Pong
//
//  Created by Sonic Bigboom on 5/10/19.
//  Copyright © 2019 "Real" Programming Club. All rights reserved.
//

import Foundation

//Vector Structure.
struct Vector {
    
    //Variables
    var x:Double
    var y:Double
    var magnitude: Double {
        return sqrt((x * x) + (y * y))
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


