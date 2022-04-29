import SwiftUI

struct HomeView: View {
    @State var hasScrolled = false
    var body: some View {
        ScrollView {
            ///to target the position of the scrollView(starting form after the navBar) I had to use named( ) with coordinateSpace(name: "scroll"), since global targets the full screen and local targets a fram moves with it
            GeometryReader{ proxy in
//                Text("\(proxy.frame(in: .named("scroll")).minY)")
                Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
            }
            .frame(height: 0)
            /// adding a frame to get rid of the default hight of the Geometry
            
            FeaturedItem()
            /// the point of adding the clear color with the frame is to show the scroll bar
            Color.clear.frame(height: 1000)
            
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0  {
                    hasScrolled = false
                } else {
                    hasScrolled = true
                }
            }
        })
        /// customising a safe area on the top to make a better display for the content
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70)
        })
        .overlay(
            NavigationBar(title: "Featured")
                .opacity(hasScrolled ? 1 : 0)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
