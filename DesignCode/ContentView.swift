import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            Image("Logo 2")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(10.0)
                .padding()
            Text("SwiftUI for iOS 15")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("20 sections - 3 hours".uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            Text("Build an iOS app for iOS 15 with custom layouts,animations and ...")
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
        }
        .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
        .padding(.vertical, 20)
        .frame(width: nil, height: 350.0)
        .background(.ultraThinMaterial) // Material is to have a glassy view
        .cornerRadius(/*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
        .padding(.horizontal,20)
        .background(
            Image("Blob 1")
                .offset(x: 0, y: -100)) // transform the image
        .overlay( // so now we 3 layers of background
            Image("Illustration 5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 230)
                .offset(x: 46, y: -80)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
