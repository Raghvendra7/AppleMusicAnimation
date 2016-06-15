//
//  BubbleNode.swift
//  Example

//

import Foundation

import UIKit
import SpriteKit

class BubbleNode: SIFloatingNode {
    var labelNode = SKLabelNode(fontNamed: "")
    
    class func instantiate(title:String) -> BubbleNode! {
        let node = BubbleNode(circleOfRadius: 30)
        configureNode(node,title: title)
        return node
    }
    
    class func configureNode(node: BubbleNode!,title:String) {
        let boundingBox = CGPathGetBoundingBox(node.path);
        let radius = boundingBox.size.width / 2.0;
        node.physicsBody = SKPhysicsBody(circleOfRadius: radius + 1.5)
        node.fillColor = SKColor.purpleColor()
        node.strokeColor = node.fillColor
        
        node.labelNode.text = title
        node.labelNode.position = CGPointZero
        node.labelNode.fontColor = SKColor.whiteColor()
        node.labelNode.fontSize = 10
        node.labelNode.userInteractionEnabled = false
        node.labelNode.verticalAlignmentMode = .Center
        node.labelNode.horizontalAlignmentMode = .Center
        node.addChild(node.labelNode)
    }
    
    override func selectingAnimation() -> SKAction? {
        removeActionForKey(BubbleNode.removingKey)
        return SKAction.scaleTo(1.3, duration: 0.2)
    }
    
    override func normalizeAnimation() -> SKAction? {
        removeActionForKey(BubbleNode.removingKey)
        return SKAction.scaleTo(1, duration: 0.2)
    }
    
    override func removeAnimation() -> SKAction? {
        removeActionForKey(BubbleNode.removingKey)
        return SKAction.fadeOutWithDuration(0.2)
    }
    
    override func removingAnimation() -> SKAction {
        let pulseUp = SKAction.scaleTo(xScale + 0.13, duration: 0)
        let pulseDown = SKAction.scaleTo(xScale, duration: 0.3)
        let pulse = SKAction.sequence([pulseUp, pulseDown])
        let repeatPulse = SKAction.repeatActionForever(pulse)
        return repeatPulse
    }
}