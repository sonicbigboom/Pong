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
    var ball = Ball(x: 0, y: 0, velocity: Vector(4,3))
    let circle = SKShapeNode(circleOfRadius: 2)
    
    override func didMove(to view: SKView) {
        ball.x = Double(view.frame.width / 2)
        ball.y = Double(view.frame.height / 2)
        ball.speed = 1
        addChild(circle)
        circle.position = CGPoint(x: ball.x, y: ball.y)
        circle.fillColor = SKColor.white
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        ball.speed = 5
        ball.move()
        var move:SKAction
        if ball.x > Double(view!.frame.width) {
            ball.moveReverse()
            ball.moveTo(x: Double(view!.frame.width), y: ball.y + ball.velocity.magnitudeFromX(Double(view!.frame.width) - ball.x))
            let moveA = SKAction.move(to: CGPoint(x: ball.x, y: ball.y), duration: 0.05)
            ball.velocity.x.negate()
            ball.move()
            let moveB = SKAction.move(to: CGPoint(x: ball.x, y: ball.y), duration: 0.05)
            move = SKAction.sequence([moveA,moveB])
        } else {
            move = SKAction.move(to: CGPoint(x: ball.x, y:ball.y), duration: 0.05)
        }
        circle.run(move)
    }
}
