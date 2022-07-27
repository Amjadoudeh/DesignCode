import SwiftUI

struct ModalView: View {
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack {
            SignupView()
            switch model.selectedModal {
            case .signIn: SignupView()
            case .signUp: SignupView()
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
