//
//  ButtonStyle.swift
//  DesignCode
//
//  Created by Amjad Oudeh on 21.07.22.
//

import SwiftUI

struct AngularButtonStyle: ButtonStyle {
    @Environment(\.controlSize) var controlSize
    var extraPadding: CGFloat {
        switch controlSize {
            
        case .mini:
            return 0
        case .small:
            return 0
        case .regular:
            return 4
        case .large:
            return 12
        @unknown default:
            return 0
        }
    }
       
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal,10 + extraPadding)
            .padding(.vertical, 4  + extraPadding)
            .background(Color(.systemBackground))
            .cornerRadius(20)
    }
}

extension  ButtonStyle where Self == AngularButtonStyle {
    static var Angular: Self {
    return .init()
    }
}
