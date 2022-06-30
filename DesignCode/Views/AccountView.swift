import SwiftUI

struct AccountView: View {
/// sitting a state for deleting
    @State var isDeleted = false
    @State var isPinned = false

    var body: some View {
        NavigationView {
            List {
                profile
                menu
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }

    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName:
                    "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
        /// will make an intersting shape using modifiers
                .background(
                    HexagonView()
                                .offset(x: -50, y: -100)
                )
                .background(
                    BlobView()
                        .offset(x: 190, y: 80)
                        .scaleEffect(0.4)
                )
            Text("Amjad Oudeh")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.small)
                Text("Berlin")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }

    var menu: some View {
        Section {
            NavigationLink(destination: HomeView()) {
                Label("Settings", systemImage: "gear")
            }
            // just using different way to navigate!
            NavigationLink {
                Text("Billing") }
        label: {
            Label("Billing", systemImage: "creditcard")
        }
            NavigationLink { Text("Help") } label: {
                Label("Help", systemImage: "questionmark")
            }
        }
        .accentColor(.primary)
        .listRowSeparatorTint(.blue) /// Changing the color of the separator
        .listRowSeparator(.hidden)
    }

    var links: some View {
        Section {

            if !isDeleted {
                Link(destination: URL(string: "https://amjadoudeh.com")!) {
                    HStack {
                        Label("Website", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                    }
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(action: { isDeleted = true }) {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    pinButton
                }
            }
            Link(destination: URL(string: "https://www.youtube.com/watch?v=QHk8N1Xaj8I")!) {
                HStack {
                    Label("Youtube", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                }
            }
            .swipeActions {
                pinButton
            }
        }
        .accentColor(.primary)
        .listRowSeparator(.hidden)
    }

    var pinButton: some View {
        Button(action: { isPinned.toggle() }) {
            if isPinned {
            Label("Pin", systemImage: "pin")
            } else {
                Label("Unpin", systemImage: "pin.slash")
            }
        }
        .tint(isPinned ? .yellow : .gray)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
