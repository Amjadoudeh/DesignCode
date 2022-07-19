import SwiftUI

struct SearchView: View {
    @State var text = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                content
            }
            .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("SwiftUI, React, UI Design, Figma")) {
                ForEach(suggestion) { suggestion in
                    Button {
                        text = suggestion.text
                    } label: {
                        Text(suggestion.text)
                            .searchCompletion(suggestion.text)
                    }
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Done").bold()
            })
        }
    }
    
    var content: some View {
        ForEach(courses.filter { $0.title.contains(text) || text == "" })
        { item in
            HStack(alignment: .top, spacing: 12) {
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 44 , height: 44)
                    .background(Color("Background"))
                    .mask(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title).bold()
                    Text(item.text)
                        .foregroundColor(.secondary)
                        .font(.footnote)
                }
            }
            .padding(4)
            .listRowSeparator(.hidden)
        }
    }
}

struct SearchView_Previewer: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
