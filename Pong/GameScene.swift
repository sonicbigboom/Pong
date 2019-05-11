//
//  GameScene.swift
//  Pong
//
//  Created by Sonic Bigboom on 5/9/19.
//  Copyright © 2019 "Real" Programming Club. All rights reserved.
//


import SpriteKit

class GameScene: SKScene {
    let label = SKLabelNode(text: "Hello SpriteKit!")
    
    override func didMove(to view: SKView) {
        addChild(label)
        label.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        label.fontSize = 45
        label.fontColor = SKColor.yellow
        label.fontName = "Avenir"
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(recognizer)
    }
    
    @objc func tap(recognizer: UIGestureRecognizer) {
        let viewLocation = recognizer.location(in: view)
        let sceneLocation = convertPoint(fromView: viewLocation)
        //let moveToAction = SKAction.move(to: sceneLocation, duration: 1)
        //label.run(moveToAction)
        //let moveByAction = SKAction.moveBy(x: sceneLocation.x - label.position.x, y: sceneLocation.y - label.position.y, duration: 1)
        //label.run(moveByAction)
        
        // Reversed action
        //let moveByReversedAction = moveByAction.reversed()
        //let moveByActions = [moveByAction, moveByReversedAction]
        //let moveSequence = SKAction.sequence(moveByActions)
        //let moveRepeatSequence = SKAction.repeat(moveSequence, count: 3)
        //let moveRepeatForeverSequence = SKAction.repeatForever(moveSequence)
        
        //label.run(moveSequence)
        //label.run(moveRepeatSequence)
        //label.run(moveRepeatForeverSequence)
        
        /*
        if atPoint(sceneLocation) == label {
            let scale = SKAction.scale(to: 0.5, duration: 1)
            label.run(scale)
        }
        */
        
        /*
        let sceneNodes = nodes(at: sceneLocation)
        for sceneNode in sceneNodes {
            if sceneNode == label {
                //let scale = SKAction.scale(to: 0.5, duration: 1)
                //let scale = SKAction.scaleX(to: 0.5, duration: 1)
                //let scale = SKAction.scaleY(to: 2, duration: 1)
                //let scale = SKAction.scaleX(to: 0.5, y: 2, duration: 1)
                //label.run(scale)
                
                //let scale = SKAction.scale(by: 0.5, duration: 1)
                let scale = SKAction.scaleX(by: 0.5, y: 2, duration: 1)
                let reverseScale = scale.reversed()
                let actions = [scale, reverseScale]
                let sequence = SKAction.sequence(actions)
                //label.run(sequence)
                //let repeatSequence = SKAction.repeat(sequence, count: 5)
                let repeatSequence = SKAction.repeatForever(sequence)
                label.run(repeatSequence)
                break
            }
        }
        */
        
        let move = SKAction.move(to: sceneLocation, duration: 1)
        //let scale = SKAction.scaleX(to: 0.5, y: 2, duration: 1)
        let scale = SKAction.scaleX(by: 0.5, y: 2, duration: 1)
        let actions = [move, scale]
        let sequence = SKAction.sequence(actions)
        label.run(sequence)
    }
}
