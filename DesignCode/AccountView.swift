//
//  AccountView.swift
//  DesignCode
//
//  Created by Amjad Oudeh on 12.04.22.
//

import SwiftUI

struct AccountView: View {
    // sitting a state for deleting
    @State var isDeleted = false
    
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
                    NavigationLink(destination: ContentView()) {
                        Label("Settings",systemImage: "gear")
                    }
                    // just using different way to navigate!
                    NavigationLink {
                        Text("Billing") }
                        label: {
                    Label("Billing",systemImage: "creditcard")
                }
                    NavigationLink { Text("Help") } label:
                        {
                        Label("Help",systemImage: "questionmark")
                    }
                }
                .accentColor(.primary)
                .listRowSeparatorTint(.blue) //Changing the color of the separator
                .listRowSeparator(.hidden)
                
                // costumise the Section by using HStack
                Section {
                    
                    if !isDeleted {
                        Link(destination: URL(string:"https://amjadoudeh.com")!) {
                            HStack {
                                Label("Website", systemImage: "house")
                                Spacer()
                                Image(systemName: "link")
                            }
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(action: { isDeleted = true }) {
                                Label("Delete", systemImage: "trash")
                            }
                            .tint(.red)
                            Button(action: { isDeleted = true }) {
                                Label("Pin", systemImage: "pin")
                            }
                            .tint(.yellow)
                    }
                    }
                    Link(destination: URL(string:"https://www.youtube.com/watch?v=QHk8N1Xaj8I")!) {
                        HStack {
                            Label("Youtube", systemImage: "tv")
                            Spacer()
                            Image(systemName: "link")
                        }
                    }
                }
                .accentColor(.primary)
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
