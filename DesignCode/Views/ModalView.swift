import SwiftUI

struct ModalView: View {
    @EnvironmentObject var model: Model
    @AppStorage("showModel") var showModel = true
    @State var viewState: CGSize = .zero
    
    var body: some View {
        ZStack {
            Color.clear.background(.regularMaterial)
                .ignoresSafeArea()
            
            switch model.selectedModal {
            case .signIn: SignInView()
            case .signUp: SignUpView()
            }
            Button {
                withAnimation {
                    showModel = false
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
        }
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                viewState = value.translation
            }
            .onEnded { value in
                withAnimation(.openCard) {
                    viewState = .zero
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
