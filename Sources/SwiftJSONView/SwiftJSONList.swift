//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 7/7/22.
//

import SwiftUI
import SwiftyJSON

struct JSONItemValue: Codable, Identifiable {
    var id = UUID()
    let key: String?
    let value: JSON
    let index: Int?
    
    init(key: String, value: JSON) {
        self.key = key
        self.value = value
        self.index = nil
    }
    
    init(key: String, value: JSON, index: Int) {
        self.key = key
        self.value = value
        self.index = index
    }
    
    init(value: JSON, index: Int) {
        self.key = nil
        self.value = value
        self.index = index
    }
}

struct SwiftJSONList: View {
    private let values: [JSONItemValue]
    
    /**
     Initialize JSONList with key, value pairs (Dict)
     */
    init(json: JSON) {
        var values: [JSONItemValue] = []
        for (key, subJson): (String, JSON) in json {
            values.append(JSONItemValue(key: key, value: subJson))
        }
        self.values = values
    }
    
    
    /**
     Initialize JSONList with key, value pairs (Dict)
     */
    init(json: [String : JSON]) {
        var values: [JSONItemValue] = []
        for (key, value) in json {
            values.append(JSONItemValue(key: key, value: value))
        }
        self.values = values
    }
    
    /**
     Initialize JSONList with array of json dicts
     */
    init(json jsonArray: [JSON]) {
        var values: [JSONItemValue] = []
        var index = 0
        for json in jsonArray {
            values.append(JSONItemValue(value: json, index: index))
            index += 1
        }
        self.values = values
    }
    
    var body: some View {
        ForEach(values.indices, id: \.self) { index in
            VStack(alignment: .leading) {
                if index > 0 {
                    Divider()
                }
                SwiftJSONItem(value: values[index])
            }
        }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftJSONList()
//    }
//}
