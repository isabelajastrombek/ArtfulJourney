import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene: SKScene {
        let s = GameScene(size: CGSize(width: 2048, height: 1536))
        s.scaleMode = .aspectFit
        return s
    }

    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
}
