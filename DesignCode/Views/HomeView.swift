import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            FeaturedItem()
        }
        .overlay(
            ZStack {
                Color.clear
                    .background(.ultraThinMaterial)
                
                Text("Featured")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
            }
                .frame(height: 70)
            // to be able to push it to the top we have to use another frame
                .frame(maxHeight: .infinity, alignment: .top)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
