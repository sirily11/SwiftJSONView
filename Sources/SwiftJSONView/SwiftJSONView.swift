import SwiftUI
import SwiftyJSON

public struct SwiftJSONView: View {
    private let jsonData: JSON
    
    public init(data: JSON) {
        jsonData = data
        
    }
    
    
    public var body: some View {
        LazyVStack(alignment: .leading) {
            SwiftJSONList(json: jsonData)
        }
    }
}


struct SwiftJSONView_Previews: PreviewProvider {
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
       SwiftJSONView(data: data1)
            .padding()
    }
}
