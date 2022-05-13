import SwiftUI

struct NavigationBar: View {

    let title: LocalizedStringKey
    @Binding var hasScrolled: Bool
    
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
                Image(systemName: "magnifyingglass")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .frame(width: 36, height: 36)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .strokeStyle(cornerRadius: 14)
                
                Image("Avatar Default")
/// changing the order of the modifiers could change the design totally
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .strokeStyle(cornerRadius: 18)
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
