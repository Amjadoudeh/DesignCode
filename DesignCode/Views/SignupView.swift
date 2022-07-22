import SwiftUI

struct SignupView: View {
    enum Field: Hashable {
        case email
        case password
    }

    @State var email: String = ""
    @State var password: String = ""
    @FocusState var focusedField: Field?

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Sign up")
                    .font(Font.largeTitle.bold())
                    .blendMode(.overlay)
                Text("Access to +120 hours of courses, tutorials and livestreams")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                TextField("Email", text: $email)
                    .inputStyle(icon: "mail")
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .focused($focusedField, equals: .email)
                    .shadow(color: focusedField == .email ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                
                SecureField("Password", text: $password)
                    .inputStyle(icon: "key")
                    .textContentType(.password)
                    .focused($focusedField, equals: .password)
                    .shadow(color: focusedField == .password ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                    
                Button {

                } label: {
                    Text("Create an account")
                        .bold()
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.Angular)
                .controlSize(.large)

                Group {
                    Text("By clicking on ")
                    + Text("_Create an account_").foregroundColor(.primary.opacity(0.7))
                    + Text(", you agree to our **Terms of service** and **[Privacy Policy](https://amjadoudeh.com/)**")
                    Divider()
                    
                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(.secondary)
                        Button { } label: {
                            Text("**Sign in**")
                            // UITableViewController -> keybord
                            // delegate method -> keybord

                        }
                    }
                }
                .font(.footnote)
                .foregroundColor(.secondary)
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
//            .preferredColorScheme(.dark)
    }
}
