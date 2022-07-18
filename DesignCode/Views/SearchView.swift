import SwiftUI

struct SearchView: View {
    @State var text = ""
    
    var body: some View {
        NavigationView {
            List(0 ..< 5) { item in
                Text("Hello Amjad")
            }
            .searchable(text: $text,placement: .navigationBarDrawer(displayMode: .always),prompt: Text("SwiftUI, React, UI Design, Figma"))
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previewer: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
