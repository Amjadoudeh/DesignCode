import SwiftUI

struct CourseView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
            }
            .background(Color("Background"))
            .ignoresSafeArea()
            
            Button {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
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
                .padding(20)
                .ignoresSafeArea()
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
            Image("Illustration 9")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image", in: namespace)
        )
        .background(
            Image("Background 5")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        )
        .overlay(
            VStack (alignment: .leading, spacing: 12) {
                Text("SHow 1")
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("20 Sections - 3 hours".uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                Text("Bulid an iOS app for iOS 15 with custom layouts, animation and ... ")
                    .font(.footnote)
                    .matchedGeometryEffect(id: "text", in: namespace)
                
                Divider()
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
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseItem(namespace: namespace, show: .constant(true))
    }
}
