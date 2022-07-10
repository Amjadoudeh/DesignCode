import SwiftUI

@main
struct DesignCodeApp: App {
    @StateObject var model = Model()

    var body: some Scene {
        WindowGroup {
           ContentView()
                .environmentObject(model)
        }
    }
}
