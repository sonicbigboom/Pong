//
//  GameScene.swift
//  Pong
//
//  Created by Sonic Bigboom on 5/9/19.
//  Copyright © 2019 "Real" Programming Club. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var ball: Ball = Ball(x: 0, y: 0, velocity: Vector(0,0), radius: 1)
    
    override func didMove(to view: SKView) {
        ball = Ball(x: Double(view.frame.width / 2), y: Double(view.frame.height / 2), velocity: Vector(4,3), radius: 2)
        ball.speed = 1
        ball.color = SKColor.white
        addChild(ball.shapeNode)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        ball.speed = 10
        var move:SKAction = ball.move()
        if ball.x > Double(view!.frame.width) {
            //ball.moveReverse()
            let moveA = ball.moveTo(x: Double(view!.frame.width), y: ball.y + ball.velocity.magnitudeFromX(Double(view!.frame.width) - ball.x))
            ball.velocity.x.negate()
            let moveB = ball.move()
            move = SKAction.sequence([moveA,moveB])
        }
        ball.shapeNode.run(move)
    }
}
