//
//  LaunchButtonNode.swift
//  CattleBattle
//
//  Created by Ding Ming on 4/4/15.
//  Copyright (c) 2015 Cattle Battle. All rights reserved.
//

import UIKit
import SpriteKit

class ArrowNode: SKSpriteNode {
    
    internal var side: GameModel.Side = .LEFT
    
    internal var originTex: SKTexture = SKTexture()
    internal var index: Int = 0
    
    struct Constants {
        private static let IMAGE_EXT = ".png"
        
        private static let SPRITE_SHEET_LENGTH = 5
        
        private static let ARROW_WIDTH: CGFloat = 120.0
        private static let ARROW_HEIGHT: CGFloat = 64.0
        private static let ANIMATION_TIME = 0.2
        private static let ALPHA: CGFloat = 0.4
        
        internal static let IDENTIFIER = "arrow"

        internal static var arrowTextures = GameModel.Side.allSides.map() { (side) -> [SKTexture] in
            var spriteSheet = SKTexture(imageNamed: Constants.IDENTIFIER + "-" + side.rawValue + Constants.IMAGE_EXT)
            
            var x = 1.0 / CGFloat(SPRITE_SHEET_LENGTH)
            var result = [SKTexture]()
            
            for i in 0..<SPRITE_SHEET_LENGTH {
                var rect = CGRectMake(CGFloat(i) * x, 0, x, 1)
                result.append(SKTexture(rect: rect, inTexture: spriteSheet))
            }
            return result
        }
    }
    
    class func getTextures(side: GameModel.Side) -> [SKTexture] {
        return Constants.arrowTextures[side.index]
    }
    
    init(side: GameModel.Side, index: Int) {
        super.init()

        self.name = Constants.IDENTIFIER
        self.size = CGSize(width: Constants.ARROW_WIDTH, height: Constants.ARROW_HEIGHT)
        self.alpha = Constants.ALPHA

        self.side = side
        self.index = index
        
        var repeatedAction = SKAction.animateWithTextures(ArrowNode.getTextures(side), timePerFrame: Constants.ANIMATION_TIME)
        self.runAction(SKAction.repeatActionForever(repeatedAction))
    }

    override init(texture:SKTexture, color:SKColor, size:CGSize) {
        super.init(texture:texture, color:color, size:size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}