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
