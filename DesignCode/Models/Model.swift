import Combine
import SwiftUI

class Model: ObservableObject {
    @Published var showDetail: Bool = false
    @Published var selectedCourse: Int = 0
    @Published var selectedModal: Modal = .signIn
    
}

enum Modal: String {
    case signIn
    case signUp
}
