// data Model
import SwiftUI

struct TabItem: Identifiable {
    var  id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: Color
}

var tabItems = [
    TabItem(text: "Learn more", icon: "house", tab: .home, color: .purple),
    TabItem(text: "Explore", icon: "magnifyingglass", tab: .explore, color: .purple),
    TabItem(text: "Notifications", icon: "bell", tab: .notifications, color: .purple),
    TabItem(text: "Library", icon: "rectangle.stack", tab: .library, color: .purple)
]

enum Tab: String {
    case home
    case explore
    case notifications
    case library
}

