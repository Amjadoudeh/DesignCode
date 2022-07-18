import SwiftUI

struct SearchView: View {
    @State var text = ""
    
    var body: some View {
        NavigationView {
            List(0 ..< 5) { item in
                Text("Hello Amjad")
            }
            .searchable(text: $text)
            .navigationTitle("Search")
        }
    }
}

struct SearchView_Previewer: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
