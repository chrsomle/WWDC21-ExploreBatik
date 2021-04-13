import SpriteKit

public class Main: SKScene {

  private var background: SKSpriteNode?

  public override func didMove(to view: SKView) {

    layoutBackground()
    layoutCharacter()

    self.run(Utils.playBacksound())
  }

  private func layoutBackground() {
    let texture = SKTexture(imageNamed: "assets/BG/BG")
    background = SKSpriteNode(texture: texture)
    background?.size = CGSize(width: 720, height: 540)
    background?.position = CGPoint(x: 0, y: 0)
    background?.zPosition = -10
    addChild(background!)
  }

  private func layoutCharacter() {
    let idle = SKSpriteNode(imageNamed: "sprites/Idle (1)")
    idle.position = CGPoint(x: 0.5, y: 0.5)
    addChild(idle)
    var textures = [SKTexture]()
    for i in 1...15 {
      textures.append(SKTexture(imageNamed: "sprites/Idle (\(i))"))
      print("sprites/Idle (\(i)) added.")
    }
    let idleAnimation = SKAction.animate(withNormalTextures: textures, timePerFrame: 0.1)
    idle.run(SKAction.repeatForever(idleAnimation))
  }
}
