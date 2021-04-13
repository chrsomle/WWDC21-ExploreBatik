/*:
 # Hi there!
 Have you ever heard of the word "Batik"? In this playground, you will be exploring many kinds of Batik – Indonesian technique of wax-resist dyeing applied to the whole cloth.
*/

import PlaygroundSupport
import SpriteKit

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 720, height: 540))
if let scene = Main(fileNamed: "Main") {
  scene.scaleMode = .aspectFill
  sceneView.presentScene(scene)
  sceneView.showsFPS = true
  sceneView.showsNodeCount = true
}

PlaygroundPage.current.liveView = sceneView
