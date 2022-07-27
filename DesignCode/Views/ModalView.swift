import SwiftUI

struct ModalView: View {
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack {
            switch model.selectedModal {
            case .signIn: SignInView()
            case .signUp: SignUpView()
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
