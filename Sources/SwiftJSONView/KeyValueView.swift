//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 7/7/22.
//

import SwiftUI

struct KeyValueView<Content: View>: View {
    let key: String
    @ViewBuilder let content: ()-> Content
    
    var body: some View {
        Text(key)
        content()
            .foregroundColor(Color.gray)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            VStack {
                KeyValueView(key: "Hello") {
                    Text("View")
                }
                
            }
            Spacer()
        }
    }
}
