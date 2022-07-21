import SwiftUI

struct SignupView: View {

    @State var email: String = " "
    @State var password: String = " "

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Sign up")
                    .font(Font.largeTitle.bold())
                    .blendMode(.overlay)
                Text("Access to +120 hours of courses, tutorials and livestreams")
                    .font(.subheadline)
                    .foregroundColor(Color.gray.opacity(0.6))
                Button {

                } label: {
                    Text("Sign up")
                        .bold()
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.Angular)
                .controlSize(.large)
            }
            .padding(20)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
            .strokeStyle(cornerRadius: 30)
            .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
            .padding(20)
            .background(
                Image("Blob 1").offset(x: 200, y: -100)
            )
        }
    }
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
            .preferredColorScheme(.dark)
    }
}
