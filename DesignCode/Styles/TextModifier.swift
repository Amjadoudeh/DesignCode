//
//  TextModifier.swift
//  DesignCode
//
//  Created by Amjad Oudeh on 19.08.22.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote.weight(.semibold))
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(TitleModifier())
    }
}
