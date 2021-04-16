import SpriteKit

public class Main: SKScene {
  
  private var background: SKSpriteNode?
  private var character: SKSpriteNode!
  
  public override func didMove(to view: SKView) {
    setupInitialConfig()
    layoutBackgrounds()
    layoutCharacter()
  }
  
  override public func update(_ currentTime: TimeInterval) {
    moveGrounds()
  }
  
  public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    // Capture the touch event.
    if let touch: UITouch = touches.first {
      
      // Get the position that was touched.
      let touchPosition = touch.location(in: self)
      
      // Get sprite's current position (a.k.a. starting point).
      let currentPosition = character.position
      
      // Calculate the angle using the relative positions of the sprite and touch.
      let angle = atan2(currentPosition.y - touchPosition.y, currentPosition.x - touchPosition.x)
      
      // Define actions for the ship to take.
      let rotateAction = SKAction.rotate(toAngle: angle + CGFloat( Double.pi * 0.5), duration: 0.0)
      let moveAction = SKAction.move(to: touchPosition, duration: 0.5)
      
      // Tell the ship to execute actions.
      character.run(SKAction.sequence([rotateAction, moveAction]))
    }
  }
  
  private func setupInitialConfig() {
    self.alpha = 0
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
    self.run(SKAction.fadeAlpha(to: 1, duration: 1))
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
  
  private func layoutCharacter() {
    character           = SKSpriteNode(imageNamed: "assets/sprites/Idle (1)")
    character.xScale    = 0.4
    character.yScale    = 0.4
    character.position  = CGPoint(x: -190, y: -120)
    addChild(character)
    
    var textures = [SKTexture]()
    for i in 1...15 {
      textures.append(SKTexture(imageNamed: "assets/sprites/Idle (\(i))"))
    }
    let idleAnimation = SKAction.animate(withNormalTextures: textures, timePerFrame: 0.1)
    character.run(SKAction.repeatForever(idleAnimation))
  }
}
