import SwiftUI

struct NavigationBar: View {

    let title: LocalizedStringKey
    @Binding var hasScrolled: Bool
    @State var showSearch: Bool = false
    @State var showAccount: Bool = false
    @AppStorage("showModel") var showModel = false
    @AppStorage("isLogged") var isLogged = false


    var body: some View {
        ZStack {
/// adding the blur modifire just to break the edges of the container which made by background modifire using the ulteaThinMaterial ( change the color to red to try it)
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 0 : 1)
            Text(title)
                .animatableFont(size: hasScrolled ? 34 : 22, weight: .bold, design: .default)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset(y: hasScrolled ? 0 : -4)

            HStack(spacing: 16) {
                Button {
                    withAnimation {
                        showSearch = true
                    }

                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.body.weight(.bold))
                        .foregroundColor(.secondary)
                        .frame(width: 36, height: 36)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .strokeStyle(cornerRadius: 14)
                }
                .sheet(isPresented: $showSearch) {
                    SearchView()
                }

                Button {
                    if isLogged {
                        showAccount = true
                    } else {
                        withAnimation {
                            showModel = true
                        }
                    }
                    

                } label: {
                AvatarView()    
                }
                .sheet(isPresented: $showAccount) {
                    AccountView()
                }
            }
            .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            .padding(.trailing, 20)
            .padding(.top, 20)
            .offset(y: hasScrolled ? 0 : -4)
        }
        .frame(height: hasScrolled ? 70 : 40)
// to be able to push it to the top we have to use another frame
            .frame(maxHeight: .infinity, alignment: .top)
    }

}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "your title", hasScrolled: .constant(false))
    }
}
