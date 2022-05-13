import SwiftUI

struct FeaturedItem: View {
    private typealias Localization = LocalizationKeys.FeaturedItem
    var course: Course = courses[0]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            Image(course.logo)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(10.0)
                .padding(9)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                .strokeStyle(cornerRadius: 20)
          //   Text(Localization.mainTitle)
            Text(course.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary,.primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            // Text(Localization.duration)
            Text(course.subtitle)
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            // Text(Localization.description)
            Text(course.description)
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
        .strokeStyle()//after creating the extension I can repleace it with my custom modifier .modifier(StrokeStyle())
        .padding(.horizontal,20)
        
        .overlay( // so now we 3 layers of background
            Image(course.image)
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
