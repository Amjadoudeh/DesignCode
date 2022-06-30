import Combine
import SwiftUI

class Model: ObservableObject {
    @Published var showDetail: Bool = false
    @Published var selectedCourse: Int = 0
}
