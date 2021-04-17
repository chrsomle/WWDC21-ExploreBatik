import SpriteKit

public class Main: SKScene {
  
  private var background: SKSpriteNode?
  private var character: SKSpriteNode!

  private var idleTextures = [SKTexture(imageNamed: "Idle (1)"),
                               SKTexture(imageNamed: "Idle (2)"),
                               SKTexture(imageNamed: "Idle (3)"),
                               SKTexture(imageNamed: "Idle (4)"),
                               SKTexture(imageNamed: "Idle (5)"),
                               SKTexture(imageNamed: "Idle (6)"),
                               SKTexture(imageNamed: "Idle (7)"),
                               SKTexture(imageNamed: "Idle (8)"),
                               SKTexture(imageNamed: "Idle (9)"),
                               SKTexture(imageNamed: "Idle (10)"),
                               SKTexture(imageNamed: "Idle (11)"),
                               SKTexture(imageNamed: "Idle (12)"),
                               SKTexture(imageNamed: "Idle (13)"),
                               SKTexture(imageNamed: "Idle (14)"),
                               SKTexture(imageNamed: "Idle (15)")]

  private var walkTextures = [SKTexture(imageNamed: "Walk (1)"),
                               SKTexture(imageNamed: "Walk (2)"),
                               SKTexture(imageNamed: "Walk (3)"),
                               SKTexture(imageNamed: "Walk (4)"),
                               SKTexture(imageNamed: "Walk (5)"),
                               SKTexture(imageNamed: "Walk (6)"),
                               SKTexture(imageNamed: "Walk (7)"),
                               SKTexture(imageNamed: "Walk (8)"),
                               SKTexture(imageNamed: "Walk (9)"),
                               SKTexture(imageNamed: "Walk (10)"),
                               SKTexture(imageNamed: "Walk (11)"),
                               SKTexture(imageNamed: "Walk (12)"),
                               SKTexture(imageNamed: "Walk (13)"),
                               SKTexture(imageNamed: "Walk (14)"),
                               SKTexture(imageNamed: "Walk (15)")]
  
  public override func didMove(to view: SKView) {
    setupInitialConfig()
    if let character = self.childNode(withName: "character") as? SKSpriteNode {
      let idleAnimation = SKAction.animate(with: idleTextures, timePerFrame: 0.05)
      character.run(SKAction.repeatForever(idleAnimation))
    }
  }
  
  override public func update(_ currentTime: TimeInterval) {
  }
  
  public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    if let touch: UITouch = touches.first {
      if let character = self.childNode(withName: "character") as? SKSpriteNode {
        let walkAnimation = SKAction.animate(with: walkTextures, timePerFrame: 0.05)
        let idleAnimation = SKAction.animate(with: idleTextures, timePerFrame: 0.05)

        let touchPosition = touch.location(in: self)
        let moveAction = SKAction.move(to: touchPosition, duration: 0.5)
        character.run(SKAction.repeatForever(walkAnimation))
        character.run(moveAction, completion: { character.run(SKAction.repeatForever(SKAction.repeatForever(idleAnimation))) })
      }
    }
  }
  
  private func setupInitialConfig() {
    self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    let backsoundAction = SKAction.repeatForever(SKAction.playSoundFileNamed(fileName: "background-music.mp3", atVolume: 0.3, waitForCompletion: true))
    self.run(backsoundAction)
  }
  
  private func layoutBackgrounds() {
    for i in 0...3 {
      let background          = SKSpriteNode(imageNamed: "assets/images/game_background")
      background.name         = "Background"
      background.size         = CGSize(width: (self.scene?.size.width)!, height: (self.scene?.size.height)!)
      background.anchorPoint  = CGPoint(x: 0.5, y: 0.5)
      background.position     = CGPoint(x: CGFloat(i) * background.size.width, y: 0)
      addChild(background)
    }
  }
  
  private func moveGrounds() {
    self.enumerateChildNodes(withName: "Background", using: {
      (node, error) in
      node.position.x -= 1
      if node.position.x < -((self.scene?.size.width)!) {
        node.position.x += (self.scene?.size.width)! * 3
      }
    })
  }
  
}
