//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 7/7/22.
//

import SwiftUI
import SwiftyJSON

struct SwiftJSONItem: View {
    let value: JSONItemValue
    
    var body: some View {
        VStack(alignment: .leading) {
            if let index = value.index {
                // render array item
                ExpandableView(key: "\(index)"){
                    SwiftJSONList(json: value.value)
                }
            }
            else if let value = value.value.dictionary {
                // render dictionary
                ExpandableView(key: self.value.key ?? ""){
                    SwiftJSONList(json: value)
                }
            } else if let value = value.value.array {
                // render array
                ExpandableView(key: self.value.key ?? "") {
                    SwiftJSONList(json: value)
                }
            } else if let value = value.value.string {
                // render string
                KeyValueView(key: self.value.key ?? "") {
                    Text(value)
                }
            } else if let value = value.value.bool {
                // render bool
                KeyValueView(key: self.value.key ?? "") {
                    Text(value.description)
                }
            } else if let value = value.value.number {
                // render number
                KeyValueView(key: self.value.key ?? "") {
                    Text(value.stringValue)
                }
            } else {
                Text("No supported")
                    .foregroundColor(Color.gray)
            }
        }
    }
}

struct SwiftJSONItem_Previews: PreviewProvider {
    static let data1: JSON = [
        "hello": "I am a very long description",
        "age": 100,
        "isHuman": false,
        "locations": [
            [
                "city": "town1",
                "distance": 100,
            ],
            [
                "city": "town2",
                "distance": 200
            ]
        ],
        "properties": [
            "damage": 100,
            "hp": 200
        ]
    ]
    
    static var previews: some View {
        SwiftJSONItem(value: JSONItemValue(key: "Hello", value: data1))
    }
}
