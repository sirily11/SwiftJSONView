//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 7/7/22.
//

import SwiftUI

struct ExpandableView<Content: View>: View {
    let key: String
    @ViewBuilder let content: () -> Content
    @State private var open = false
    @State private var rotate = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                toggle()
            }) {
                Image(systemName: "arrowtriangle.right.fill")
                    .resizable()
                    .frame(width: 10, height: 10, alignment: .center)
                    .foregroundColor(.gray)
                    .rotationEffect(Angle(degrees: rotate ? 90 : 0))
                
                Text(key)
                Spacer()
            }
            
            if open {
                Divider()
                content()
                    .padding(.leading)
            }
        }
    }
    
    func toggle(){
        open.toggle()
        withAnimation {
            rotate.toggle()
        }
    }
}

struct ExpandableView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableView(key: "Hello"){
            Text("Hello world")
        }
    }
}
