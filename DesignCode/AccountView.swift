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
                VStack(spacing: 8) {
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
                    Text("Amjad Oudeh")
                        .font(.title.weight(.semibold))
                    HStack {
                        Image(systemName: "location")
                            .imageScale(.small)
                        Text("Berlin")
                            .foregroundColor(.secondary)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                Section {
                    Label("Settings",systemImage: "gear")
                    Label("Billing",systemImage: "creditcard")
                    Label("Help",systemImage: "questionmark")
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
