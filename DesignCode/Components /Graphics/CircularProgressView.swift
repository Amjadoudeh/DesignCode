import SwiftUI

struct CircularProgressView: View {
    var value: CGFloat = 0.2
    @State var appear = false
    var lineWidth: Double = 4
    
    var body: some View {
        Circle()
            .trim(from: 0, to: appear ? value : 0)
            .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .fill(.angularGradient(colors: [.purple, .pink, .purple], center: .center, startAngle: .degrees(0), endAngle: .degrees(360)))
            .rotationEffect(.degrees(270))
            .onAppear {
                withAnimation(.spring().delay(0.6)) {
                    appear = true
                }
            }
            .onDisappear {
                appear = false
            }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView()
    }
}
