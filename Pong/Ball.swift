//
//  Ball.swift
//  Pong
//
//  Created by Sonic Bigboom on 5/9/19.
//  Copyright © 2019 "Real" Programming Club. All rights reserved.
//

import Foundation
import SpriteKit

//Object Class.
class Ball: Object {
    
    //Variables
    var radius: Double
    
    //Initializers:
    //Initialize with x, y and initial velocity and radius.
    init(x:Double, y:Double, velocity:Vector, radius:Double) {
        self.radius = radius
        super.init(x: x, y: y, velocity: velocity)
        shapeNode = SKShapeNode(circleOfRadius: CGFloat(radius))
        self.x = x
        self.y = y
    }
}
