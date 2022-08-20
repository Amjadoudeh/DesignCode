import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @EnvironmentObject var model: Model
    @AppStorage("showModel") var showModel = false

    var body: some View {
        ZStack(alignment: .bottom) {
                switch selectedTab {
                case .home:
                    HomeView()
                case .explore:
                    ExploreView()
                case .notifications:
                    NotificationsView()
                case .library:
                    HomeView()
                }
            TabBar()
                .offset(y: model.showDetail ? 200 : 0)
            if showModel {
               ModalView()
                .zIndex(1)
            }
        }
        /// customise a safe area for the TabBar
        .safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: 44)
        })
        .dynamicTypeSize(.large ... .xxxLarge)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.locale, .init(identifier: "en"))
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
            .environmentObject(Model())
    }
}
