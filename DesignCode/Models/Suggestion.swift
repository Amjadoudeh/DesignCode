import SwiftUI

struct Suggestion: Identifiable {
    let id = UUID()
    var text: String
}
 var suggestion = [
    Suggestion(text: "SwiftUI"),
    Suggestion(text: "React"),
    Suggestion(text: "Design")
 ]
