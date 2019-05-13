//
//  Rectangle.swift
//  Pong
//
//  Created by Sonic Bigboom on 5/13/19.
//  Copyright © 2019 "Real" Programming Club. All rights reserved.
//

import Foundation
import SpriteKit

class Rectangle: Object {
    
    //Variables
    var width: Double
    var height: Double
    
    //Initializers:
    //Initialize with x, y and initial velocity and width and height.
    init(x:Double, y:Double, velocity:Vector, width:Double, height:Double) {
        self.width = width
        self.height = height
        super.init(x: x, y: y, velocity: velocity)
        shapeNode = SKShapeNode(rect: CGRect(x: x, y: y, width: width, height: height))
    }
    //Initialize with x, y and direction and width and height.
    init(x:Double, y:Double, direction:Vector, width:Double, height:Double) {
        self.width = width
        self.height = height
        super.init(x: x, y: y, direction: direction)
        shapeNode = SKShapeNode(rect: CGRect(x: x, y: y, width: width, height: height))
    }
}
