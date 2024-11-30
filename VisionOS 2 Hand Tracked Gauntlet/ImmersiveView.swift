//
//  ImmersiveView.swift
//  VisionOS 2 Hand Tracked Gauntlet
//
//  Created by Cole Dennis on 11/29/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {

    @State private var session: SpatialTrackingSession?
    
    var body: some View {
        RealityView { content in
            
            //Begin a spatial tracking session to understand the location of the user's hands.

            let session = SpatialTrackingSession()
            let configuration = SpatialTrackingSession.Configuration(tracking: [.hand])
            _ = await session.run(configuration)
            self.session = session
            
            //Setup an anchor at the user's left palm.
            let handAnchor = AnchorEntity(.hand(.left, location: .palm), trackingMode: .continuous)

            //Add the Gauntlet scene that was set up in Reality Composer Pro.
            if let gauntletEntity = try? await Entity(named: "Gauntlet", in: realityKitContentBundle) {
               
                //Child the gauntlet scene to the handAnchor.
                handAnchor.addChild(gauntletEntity)
                
                // Add the handAnchor to the RealityView scene.
                content.add(handAnchor)
               
            }
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
