import SwiftUI

struct ModalView: View {
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack {
            switch model.selectedModal {
            case .signIn: SignUpView()
            case .signUp: SignInView()
            }
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
            .environmentObject(Model())
    }
}
