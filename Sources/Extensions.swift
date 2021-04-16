import SpriteKit
import AVFoundation

public extension SKAction {

  class func playSoundFileNamed(fileName: String, atVolume: Float, waitForCompletion: Bool) -> SKAction {

    let nameOnly = URL(fileURLWithPath: fileName).deletingPathExtension().lastPathComponent
    let fileExt  = fileName.pathExtension

    let soundPath = Bundle.main.url(forResource: nameOnly, withExtension: fileExt)

    var player: AVAudioPlayer!
    do {
       player = try AVAudioPlayer(contentsOf: soundPath!)
    } catch {
        debugPrint("Error with playing soundFile: \(error.localizedDescription)")
    }

    player.volume = atVolume

    let playAction: SKAction = SKAction.run { () -> Void in
        player.play()
    }

    if(waitForCompletion){
        let waitAction = SKAction.wait(forDuration: player.duration)
        let groupAction: SKAction = SKAction.group([playAction, waitAction])
        return groupAction
    }

    return playAction
 }
}

extension String {
    var ns: NSString {
        return self as NSString
    }
    var pathExtension: String {
        return ns.pathExtension
    }
    var lastPathComponent: String {
        return ns.lastPathComponent
    }
}
