import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            FeaturedItem()
            Color.clear.frame(height: 1000)
        }
        /// customising a safe area on the top to make a better display for the content
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70)
        })
        .overlay(
           NavigationBar(title: "Featured")
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
