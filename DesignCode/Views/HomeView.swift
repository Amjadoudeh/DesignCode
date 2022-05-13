import SwiftUI

struct HomeView: View {
    @State var hasScrolled = false
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                scrollDetection
                /// Creating horizental Navigation
                featured
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
                NavigationBar(title: LocalizationKeys.MainView.navtitle, hasScrolled: $hasScrolled)
            )
        }
    }
    
    var scrollDetection: some View {
///to target the position of the scrollView(starting form after the navBar) I had to use named( ) with coordinateSpace(name: "scroll"), since global targets the full screen and local targets a fram moves with it
        GeometryReader{ proxy in
            //Text("\(proxy.frame(in: .named("scroll")).minY)")
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0) /// adding a frame to get rid of the default hight of the Geometry
    }
    
    var featured: some View {
        TabView {
            ForEach(courses) { course in
                GeometryReader { proxy in
                FeaturedItem(course: course)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(proxy.frame(in: .global).minX / -15), axis: (x: 0, y: 2, z: 10))
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                    //Text("\(proxy.frame(in: .global).minX)")
                        .overlay( // so now we 3 layers of background
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(x: 35, y: -80)
                        )
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)) // transform the image
        
    }
}

struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
