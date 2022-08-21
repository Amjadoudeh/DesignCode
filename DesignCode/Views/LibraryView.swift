import SwiftUI

struct LibraryView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                coursesSection
                
                Text("Topics".uppercased())
                    .titleStyle()
                topicsSection
                
                Text("Certificates".uppercased())
                    .titleStyle()
                
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 70)
            }
            .overlay(NavigationBar(title: "Library", hasScrolled: .constant(true)))
            .background(Image("Blob 1").offset(x: -100, y: -350))
        }
    }
    var coursesSection: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack (spacing: 16){
                ForEach(courses) { course in
                    SmallCourseItem(course: course)
                }
            }
            .padding(.horizontal, 20)
            Spacer()
            
        }
    }
    
    
    var topicsSection: some View {
        VStack {
            ForEach(topics) { topic in
                TopicListRow(topic: topic)
            }
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(.horizontal, 20)
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
