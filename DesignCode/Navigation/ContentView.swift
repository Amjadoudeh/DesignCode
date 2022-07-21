import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @EnvironmentObject var model: Model
    @AppStorage("showModel") var showModel = false

    var body: some View {
        ZStack(alignment: .bottom) {
/// using switch instead of using if 
                switch selectedTab {
                case .home:
                    HomeView()
                case .explore:
                    AccountView()
                case .notifications:
                    HomeView()
                case .library:
                    SignupView()
                }
            TabBar()
                .offset(y: model.showDetail ? 200 : 0)
            if showModel {
                ZStack {
                    Color.clear.background(.regularMaterial)
                        .ignoresSafeArea()
                    SignupView()
                    Button {
                        withAnimation {
                            showModel = false
                        }
                        
                    } label: {
                        Image(systemName: "xmark")
                            .font(.body.weight(.bold))
                            .foregroundColor(.secondary)
                            .padding(8)
                            .background(.ultraThinMaterial, in: Circle())
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .padding(20)
                    
                }
                .zIndex(1)
            }
        }
        /// customise a safe area for the TabBar
        .safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: 44)
        })
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
