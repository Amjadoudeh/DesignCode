import SwiftUI

struct StrokeStyleModifier: ViewModifier {
    // created a variable cornerRadius to be able to pass the value of it in the modifier as Dynamic value: type CGFloat
    var cornerRadius: CGFloat
    // adopting to the darkMode
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(
                cornerRadius: cornerRadius,
                style: .continuous
            )
                .stroke(
                    .linearGradient(
                        colors: [
                            .white.opacity(colorScheme == .dark ? 0.1 : 0.3 ),
                            .black.opacity(colorScheme == .dark ? 0.3 : 0.1 )
                        ],
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
        modifier(StrokeStyleModifier(cornerRadius: cornerRadius))
    }
}
