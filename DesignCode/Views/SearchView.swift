import SwiftUI

struct SearchView: View {
    @State var text = ""
    
    var body: some View {
        NavigationView {
            List  {
                ForEach(courses.filter { $0.title.contains(text) || text == ""
                    
                }) { item in
                    Text(item.title)
                }
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
