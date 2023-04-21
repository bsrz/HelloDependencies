import Dependencies
import Logging
import SwiftUI
import Tracking

@main
struct App: SwiftUI.App {

    @Dependency(\.tracker) private var tracker

    var body: some Scene {
        WindowGroup {
            AppView()
                .task {
                    tracker.track(event: .onLaunch)
                }
        }
    }
}
