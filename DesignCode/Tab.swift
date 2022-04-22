// data Model
import SwiftUI

struct TabItem: Identifiable {
    var  id = UUID()
    var text: String
    var icon: String
}

var tabItems = [
TabItem(text: "Learn more", icon: "house"),
TabItem(text: "Explore", icon: "magnifyingglass"),
TabItem(text: "Notifications", icon: "bell"),
TabItem(text: "Library", icon: "rectangle.stack")
]
