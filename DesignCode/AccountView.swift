//
//  AccountView.swift
//  DesignCode
//
//  Created by Amjad Oudeh on 12.04.22.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            List {
                Image(systemName:
                        "person.crop.circle.fill.badge.checkmark")
                    .symbolVariant(.circle.fill)
                    .font(.system(size: 32))
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.blue, .blue.opacity(0.3))
                    .padding()
                    .background(Circle().fill(.ultraThinMaterial))
                    // will make an intersting shape using modifiers
                    .background(Image(systemName: "hexagon")
                                    .symbolVariant(.fill)
                                    .foregroundColor(.blue)
                                    .font(.system(size: 200))
                                    .offset(x: -50, y: -100)
                    )
                Section {
                    Text("Settings")
                    Text("Billing")
                    Text("Help")
                }
                .listRowSeparatorTint(.blue) // Changing the color of the separator
                .listRowSeparator(.hidden)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
