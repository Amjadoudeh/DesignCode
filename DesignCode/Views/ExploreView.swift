import SwiftUI

struct ExploreView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack (spacing: 16){
                    ForEach(courses) { course in
                        SmallCourseItem(course: course)
                    }
                }
                .padding(.horizontal, 20)
                Spacer()
                
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 70)
            }
            .overlay(NavigationBar(title: "Recent", hasScrolled: .constant(true)))
            .background(Image("Blob 1").offset(x: -100, y: -350))
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
