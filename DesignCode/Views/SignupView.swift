import SwiftUI

struct SignupView: View {

    @State var email : String = " "
    @State var password : String = " "
    
    var body: some View {
        ZStack {
            Image("Background 2")
                .resizable()
              //  .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(alignment: .leading ,spacing: 16) {
                    Text("Sign up")
                        .font(Font.largeTitle.bold())
                        .foregroundColor(.white)
                    Text("Access to +120 hours of courses, tutorials and livestreams")
                        .font(.subheadline)
                        .foregroundColor(Color.white.opacity(0.6))
                    HStack(spacing: 12) {
                        Image(systemName: "envelope.open.fill")
                            .foregroundColor(Color.white)
                        
                        TextField("Email", text: $email)
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
                    
                }
                .padding(20)
            }
            .background(.ultraThinMaterial)
            .cornerRadius(30)
            .padding(.horizontal, 20)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
