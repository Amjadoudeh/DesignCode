import SwiftUI

struct SignupView: View {

    @State var email: String = " "
    @State var password: String = " "

    var body: some View {
        ZStack {
            Image("Background 2")
                .resizable()
              //  .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Sign up")
                        .font(Font.largeTitle.bold())
                        .blendMode(.overlay)
                    Text("Access to +120 hours of courses, tutorials and livestreams")
                        .font(.subheadline)
                        .foregroundColor(Color.white.opacity(0.6))
                    HStack(spacing: 12) {
                        Image(systemName: "envelope.open.fill")
                            .foregroundColor(Color.white)

                        TextField("Email address", text: $email)
                            .foregroundColor(Color.white.opacity(0.6))
                            .autocapitalization(.none)
                            .textContentType(.emailAddress)
                    }
                    .frame(height: 52)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white, lineWidth: 1.0)
                            .blendMode(.overlay)
                    )
                    .background(
                        Color("Background")
                            .cornerRadius(16)
                            .opacity(0.8)
                    )
                    HStack(spacing: 12) {
                        Image(systemName: "key.fill")
                            .foregroundColor(Color.white)

                        TextField("Password", text: $password)
                            .foregroundColor(Color.white.opacity(0.6))
                            .autocapitalization(.none)
                            .textContentType(.password)
                    }
                    .frame(height: 52)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white, lineWidth: 1.0)
                            .blendMode(.overlay)
                    )
                    .background(
                        Color("Background")
                            .cornerRadius(16)
                            .opacity(0.8)
                    )
                    Button(action: {
                        print("Sign up")
                    }, label: {
                        GeometryReader { geometry in
                            ZStack {
                                AngularGradient(gradient: Gradient(colors: [Color.purple, Color.red]), center: .center, angle: .degrees(0))
                                    .blendMode(.overlay)
                                    .blur(radius: 8.0)
                                    .mask(
                                        RoundedRectangle(cornerRadius: 16.0)
                                            .frame(height: 50)
                                            .frame(maxWidth: geometry.size.width - 16)
                                            .blur(radius: 8.0)

                                )
                                GradientText(title: "Sign up")
                                    .font(.headline)
                                    .frame(maxWidth: geometry.size.width - 16)
                                    .frame(height: 50)
                                    .background(
                                        Color("Background")
                                            .opacity(0.7)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16.0)
                                            .stroke(Color.white, lineWidth: 1.8)
                                            .blendMode(.normal)
                                            .opacity(0.7)
                                    )
                                    .cornerRadius(16.0)
                            }
                        }
                        .frame(height: 50)
                    })

                    Text("By clicking on Sign up, you agree to our Terms of service and Privacy policy")
                        .font(.footnote)
                        .foregroundColor(Color.white.opacity(0.7))
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.white.opacity(0.1))

                    VStack(alignment: .leading, spacing: 16) {
                        Button(action: {
                            print("Switch to Sign in")
                        }, label: {
                            HStack(spacing: 4) {
                                Text("Alreay have an account? ")
                                    .font(.footnote)
                                    .foregroundColor(Color.white.opacity(0.7))
                                GradientText(title: "Sign up")
                                    .font(Font.footnote.bold())

                            }
                        })
                    }
                }
                .padding(20)
            }
            .background(.ultraThinMaterial)
            .cornerRadius(30)
            .padding(.horizontal)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self
            .overlay(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}

struct GradientText: View {
    var title: String = ""

    var body: some View {
        Text(title)
            .gradientForeground(colors: [Color.pink, Color.blue])
    }
}
