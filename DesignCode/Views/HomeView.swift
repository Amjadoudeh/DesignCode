import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            FeaturedItem()
        }
        .overlay(
           NavigationBar()
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
