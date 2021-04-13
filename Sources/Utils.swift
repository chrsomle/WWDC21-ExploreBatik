import SpriteKit

public struct Utils {
  static func playBacksound() -> SKAction {
    SKAction.repeatForever(SKAction.playSoundFileNamed("background-music", waitForCompletion: true))
  }
}
