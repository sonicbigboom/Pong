//
//  Object.swift
//  Pong
//
//  Created by Sonic Bigboom on 5/12/19.
//  Copyright © 2019 "Real" Programming Club. All rights reserved.
//

import Foundation
import SpriteKit
import Darwin

//Object Class.
class Object {
    
    //Variables
    var shapeNode:SKShapeNode = SKShapeNode(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 1, height: 1)))
    var x:Double {
        get {
            return Double(shapeNode.position.x)
        }
        set(newX) {
            shapeNode.position.x = CGFloat(newX)
        }
    }
    var y:Double {
        get {
            return Double(shapeNode.position.y)
        }
        set(newY) {
            shapeNode.position.y = CGFloat(newY)
        }
    }
    var direction:Vector
    var speed:Double
    var locked:Bool
    var moveTime:Double = 0.2
    var angle:Double {
        get {
            return direction.angle
        }
        set(newAngle) {
            direction.angle = newAngle
        }
    }
    var color: SKColor {
        get {
            return shapeNode.fillColor
        }
        set(newColor) {
            shapeNode.fillColor = newColor
        }
    }
    
    //The velocity is the direction (direction) times its speed.
    var velocity:Vector {
        get {
            return direction * speed
        }
        set(newVelocity) {
            direction = newVelocity.unitVector()
            speed = newVelocity.magnitude
        }
    }
    
    //Initializers:
    //Initialize with x, y and initial velocity.
    init(x:Double, y:Double, velocity:Vector) {
        self.shapeNode.position = CGPoint(x: x, y: y)
        self.direction = velocity.unitVector()
        self.locked = false
        self.speed = velocity.magnitude
    }
    //Initialize with x, y and direction as a vector.
    init(x:Double, y:Double, direction:Vector) {
        self.locked = true
        self.shapeNode.position = CGPoint(x: x, y: y)
        self.direction = direction.unitVector()
        self.speed = 0
    }
    //Initialize with x, y and direction as an angle.
    init(x:Double, y:Double, directionAsAngle:Double) {
        self.locked = true
        self.shapeNode.position = CGPoint(x: x, y: y)
        self.direction = Vector(1,0)
        self.direction.angle = directionAsAngle
        self.speed = 0
    }
    
    //Functions:
    //Make the object move based on its current velocity.
    //NOTE: BOUNCING PHYSICS NOT YET IMPLEMENTED
    func move() -> SKAction {
        x += velocity.x
        y += velocity.y
        return SKAction.move(to: CGPoint(x: x, y: y), duration: moveTime)
    }
    //Move to a specific location.
    func moveTo(x:Double ,y:Double) -> SKAction {
        let distance = sqrt(pow(self.x - x, 2) + pow(self.y - y, 2))
        self.x = x
        self.y = y
        return SKAction.move(to: CGPoint(x: x, y: y), duration: moveTime * distance / speed)
    }
}
