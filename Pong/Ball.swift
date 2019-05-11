//
//  Ball.swift
//  Pong
//
//  Created by Sonic Bigboom on 5/9/19.
//  Copyright © 2019 "Real" Programming Club. All rights reserved.
//

import Foundation

//Ball Class.
class Ball {
    
    //Variables
    var x:Double
    var y:Double
    var unitVelocity:Vector
    var speed:Double
    
    //The velocity is the direction (unitVelocity) times its speed.
    var velocity:Vector {
        get {
            return unitVelocity * speed
        }
        set(newVelocity) {
            unitVelocity = newVelocity.unitVector()
            speed = newVelocity.magnitude
        }
    }
    
    //Initializers:
    //Initialize with x and y.
    init(x:Double,y:Double) {
        self.x = x
        self.y = y
        self.unitVelocity = Vector(0,0)
        self.speed = 0
    }
    //Initialize with x and y and initial velocity.
    init(x:Double, y:Double, velocity:Vector) {
        self.x = x
        self.y = y
        self.unitVelocity = velocity.unitVector()
        self.speed = velocity.magnitude
    }
    
    //Functions:
    //Make the ball move based on its current velocity.
    //NOTE: BOUNCING PHYSICS NOT YET IMPLEMENTED
    func move() {
        x += velocity.x
        y += velocity.y
    }
}
