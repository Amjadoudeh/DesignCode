import SwiftUI

struct HomeView: View {
    @State var hasScrolled = false
    @State var show = false
    @State var showStatusBar = true
    @State var selectedId = UUID()
    @EnvironmentObject var model: Model
    @State var selectedCourse: Course = courses[0]

    @Namespace var namespace

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()

            ScrollView {
                scrollDetection

                featured

                Text("Courses".uppercased())
                    .sectionTitleModifier()

                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 20)], spacing: 20) {
                if !show {
                    cards
                } else {
                    ForEach(courses) { _ in
                        Rectangle()
                            .fill(.white)
                            .frame(height: 300)
                            .cornerRadius(30)
                            .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 10)
                            .opacity(0.3)
                        .padding(.horizontal, 20)
                    }
                }
                }
                .padding(20)
            }
            .coordinateSpace(name: "scroll")
            /// customising a safe area on the top to make a better display for the content
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: LocalizationKeys.MainView.navtitle, hasScrolled: $hasScrolled)
            )
            if show {
                detail
            }

        }
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation(.closeCard) {
                if newValue {
                    showStatusBar = false
                } else {
                    showStatusBar = true
                }
            }
        }
    }

    var scrollDetection: some View {
        /// to target the position of the scrollView(starting form after the navBar) I had to use named( ) with coordinateSpace(name: "scroll"), since global targets the full screen and local targets a fram moves with it
        GeometryReader { proxy in
            // Text("\(proxy.frame(in: .named("scroll")).minY)")
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0) /// adding a frame to get rid of the default hight of the Geometry
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = false
                } else {
                    hasScrolled = true
                }
            }
        })
    }

    var featured: some View {
        TabView {
            ForEach(featuredCourses) { course in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX

                    FeaturedItem(course: course)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -15), axis: (x: 0, y: 2, z: 10))
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX / 50))
                    // Text("\(proxy.frame(in: .global).minX)")
                        .overlay( // so now we 3 layers of background
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                                .offset(x: 35, y: -80)
                                .offset(x: minX / 2)
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

    var cards: some View {
        ForEach(courses) { course in
            CourseItem(namespace: namespace, course: course, show: $show)
                .onTapGesture {
                    withAnimation(.openCard) {
                        show.toggle()
                        model.showDetail.toggle()
                        showStatusBar = false
                        selectedId = course.id
                    }

                }
        }
    }
    var detail: some View {
        ForEach(courses) { course in
            if course.id == selectedId {
                CourseView(namespace: namespace, show: $show, course: course)
                    .zIndex(1)
                    .transition(.asymmetric(
                        insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                        removal: .opacity.animation(.easeInOut(duration: 0.1))
                    )
                    )
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Model())
    }
}
