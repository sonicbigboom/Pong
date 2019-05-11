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
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(recognizer)
    }
    
    @objc func tap(recognizer: UIGestureRecognizer) {
        //let viewLocation = recognizer.location(in: view)
        //let sceneLocation = convertPoint(fromView: viewLocation)
        ball.speed = 100
        ball.move()
        let move = SKAction.move(to: CGPoint(x: ball.x, y:ball.y), duration: 0.5)
        circle.run(move)
    }
    
}
