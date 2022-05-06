import SwiftUI

struct FeaturedItem: View {
    private typealias Localization = LocalizationKeys.FeaturedItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            Image("Logo 2")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(10.0)
                .padding(9)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                .strokeStyle(cornerRadius: 20)
            Text(Localization.mainTitle)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary,.primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text(Localization.duration)
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            Text(Localization.description)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.secondary)
        }
        .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
        .padding(.vertical, 20)
        .frame(width: nil, height: 350.0)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous)) // Material is to have a glassy view
        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
        .strokeStyle()//after creating the extension I can repleace it with my custom modifier .modifier(StrokeStyle())
        .padding(.horizontal,20)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)) // transform the image
        .overlay( // so now we 3 layers of background
            Image("Illustration 5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 230)
                .offset(x: 35, y: -80)
        )
    }
}


struct FeaturedItem_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItem()
    }
}
