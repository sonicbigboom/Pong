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
    
    //Implement vector multiplication.
    static func *(lhs:Vector, rhs:Double) -> Vector {
        return Vector(lhs.x * rhs, lhs.y * rhs)
    }
    static func *(lhs:Double, rhs:Vector) -> Vector {
        return Vector(rhs.x * lhs, rhs.y * lhs)
    }
}


