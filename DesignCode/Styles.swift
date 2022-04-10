import SwiftUI

struct StrokeStyle: ViewModifier {
    // created a variable cornerRadius to be able to pass the value of it in the modifier as Dynamic value: type CGFloat
    var cornerRadius : CGFloat
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(
                cornerRadius: cornerRadius,
                style: .continuous
            )
                .stroke(
                    .linearGradient(
                        colors: [.white.opacity(0.3),.black.opacity(0.1)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .blendMode(.overlay)
        )
    }
}

extension View {
    // the function is receiving a cornerRaduis type CGFloat and its value is 30 so it will be the Defaul value.
    func strokeStyle(cornerRadius: CGFloat = 30) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}

