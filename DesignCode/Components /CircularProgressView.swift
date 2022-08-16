import SwiftUI

struct CircularProgressView: View {
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.4)
            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
            .fill(.angularGradient(colors: [.purple, .pink, .purple], center: .center, startAngle: .degrees(0), endAngle: .degrees(360)))
            .rotationEffect(.degrees(270))
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView()
    }
}
