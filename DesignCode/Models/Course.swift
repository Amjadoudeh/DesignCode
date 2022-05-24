import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var index: Int
    var title: String
    var subtitle: String
    var description: String
    var image: String
    var logo: String
    var background: String
}

var courses = [
    Course(index: 1,title: "SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", description: "Build an iOS app for iOS 15 with custom layouts, animations and ...", image: "Illustration 5",logo: "Logo 2", background: "Background 5"),
    Course(index: 2,title: "UI Design for iOS 15", subtitle: "20 sections - 3 hours", description: "Design an iOS app for iOS 15 with custom layouts, animations and ...", image: "Illustration 3",logo: "Logo 4", background: "Background 4"),
    Course(index: 3,title: "Flutter for designers", subtitle: "20 sections - 3 hours", description: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.", image: "Illustration 1", logo: "Logo 1", background: "Background 1"),
    Course(index: 4,title: "React Hooks Advanced", subtitle: "20 sections - 3 hours", description: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud", image: "Illustration 2", logo: "Logo 3", background: "Background 2")
]
