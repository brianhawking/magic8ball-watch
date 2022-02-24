//
//  Magic8BallApp.swift
//  Magic8Ball WatchKit Extension
//
//  Created by Brian Veitch on 2/20/22.
//

import SwiftUI

@main
struct Magic8BallApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
