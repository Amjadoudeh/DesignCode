import SwiftUI

struct ModalView: View {
    @EnvironmentObject var model: Model
    @AppStorage("showModel") var showModel = true
    @State var viewState: CGSize = .zero
    
    var body: some View {
        ZStack {
            Color.clear.background(.regularMaterial)
                .ignoresSafeArea()
            
            Group {
                switch model.selectedModal {
                case .signIn: SignInView()
                case .signUp: SignUpView()
                }
            }
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .offset(x: viewState.width, y: viewState.height)
            .rotationEffect(.degrees(viewState.width)/30)
            .hueRotation(.degrees(viewState.width)/5)
            .hueRotation(.degrees(viewState.height)/5)
            .gesture(drag)
            .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
            .padding(20)
            .background(
                Image("Blob 1").offset(x: 200, y: -100)
            )
            
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
                if value.translation.height > 200 {
                    withAnimation {
                        showModel = false
                    }
                } else {
                withAnimation(.openCard) {
                    viewState = .zero
                    }
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
