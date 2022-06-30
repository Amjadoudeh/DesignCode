import SwiftUI

struct CourseView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    @State var appear = [false, false, false]
    @Binding var course: Course

    var body: some View {
        ZStack {
            ScrollView {
                cover
            }
            .background(Color("Background"))
            .ignoresSafeArea()

            button
        }
        .onAppear {
            withAnimation(.easeOut.delay(0.3)) {
                appear[0] = true
            }
            withAnimation(.easeOut.delay(0.4)) {
                appear[1] = true
            }
            withAnimation(.easeOut.delay(0.5)) {
                appear[2] = true
            }
        }
        .onChange(of: show) { _ in
            appear[0] = false
            appear[1] = false
            appear[2] = false
        }
    }

    var cover: some View {

        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .foregroundStyle(.black)
        .background(
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image", in: namespace)
        )
        .background(
            Image(course.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        )
        .overlay(
            VStack(alignment: .leading, spacing: 12) {
                Text(course.title)
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(course.subtitle.uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                Text(course.description)
                    .font(.footnote)
                    .matchedGeometryEffect(id: "text", in: namespace)

                Divider()
                    .opacity(appear[0] ? 1 : 0)
                HStack {
                    Image("Avatar Default")
                    /// changing the order of the modifiers could change the design totally
                        .resizable()
                        .frame(width: 26, height: 26)
                        .cornerRadius(10)
                        .padding(8)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                        .strokeStyle(cornerRadius: 18)
                    Text("Taught by Amjad Oudeh")
                }
                .opacity(appear[1] ? 1 : 0)
            }
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .matchedGeometryEffect(id: "blur", in: namespace)
                )
                .offset(y: 250)
                .padding(20)
        )
    }

    var button : some View {
        Button {
            withAnimation(.closeCard) {
                show.toggle()
                }
            } label: {
            Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(32)
            .ignoresSafeArea()
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        CourseView(namespace: namespace, show: .constant(true), course: .constant(courses[0]))
    }
}
