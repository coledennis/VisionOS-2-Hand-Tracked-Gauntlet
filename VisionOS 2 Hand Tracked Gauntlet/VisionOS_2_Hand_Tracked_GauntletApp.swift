//
//  VisionOS_2_Hand_Tracked_GauntletApp.swift
//  VisionOS 2 Hand Tracked Gauntlet
//
//  Created by Cole Dennis on 11/29/24.
//

import SwiftUI

@main
struct VisionOS_2_Hand_Tracked_GauntletApp: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }

        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView()
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
     }
}
