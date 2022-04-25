//
//  NavigationBar.swift
//  DesignCode
//
//  Created by Amjad Oudeh on 25.04.22.
//

import SwiftUI

struct NavigationBar: View {
    var title = ""
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
            
            Text(title)
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
        }
            .frame(height: 70)
        // to be able to push it to the top we have to use another frame
            .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Featured")
    }
}
