//
//  MatchedView.swift
//  DesignCode
//
//  Created by Amjad Oudeh on 14.05.22.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
            Text("SHow 1 ")
                    
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                Text("Show 2 ")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .onTapGesture {
            withAnimation {
                show.toggle()
            }
            
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
