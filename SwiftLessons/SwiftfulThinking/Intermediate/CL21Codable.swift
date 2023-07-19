//
//  CL21Codable.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/5/23.
//

import SwiftUI

struct CL21CustomerModel: Identifiable, Decodable, Encodable {
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
    
    init(id: String, name: String, points: Int, isPremium: Bool) {
        self.id = id
        self.name = name
        self.points = points
        self.isPremium = isPremium
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case points
        case isPremium
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.points = try container.decode(Int.self, forKey: .points)
        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.points, forKey: .points)
        try container.encode(self.isPremium, forKey: .isPremium)
    }
}

class CL21CodableViewModel: ObservableObject {
    @Published var customer: CL21CustomerModel? = CL21CustomerModel(id: UUID().uuidString, name: "Doge", points: 4, isPremium: true)
    
    init() {
        getData()
    }
    
    func getData() {
        guard let data = getJSONData() else { return }
        
        do {
            self.customer = try JSONDecoder().decode(CL21CustomerModel.self, from: data)
        } catch let error {
            print("Error Decoding: \(error.localizedDescription)")
        }
        
        
//        if let localData = try? JSONSerialization.jsonObject(with: data), let dict = localData as? [String: Any] {
//
//            let id = dict["id"] as? String ?? ""
//            let name = dict["name"] as? String ?? ""
//            let points = dict["points"] as? Int ?? 0
//            let isPremium = dict["isPremium"] as? Bool ?? false
//
//            let newCustomer = CL21CustomerModel(id: id, name: name, points: points, isPremium: isPremium)
//
//            customer = newCustomer
//        }
        
//        print("JSON: \(data)")
//        let jsonString = String(data: data, encoding: .utf8)
//        print(jsonString ?? "")
    }
    
    func getJSONData() -> Data? {
        let customer = CL21CustomerModel(id: "111", name: "Chungus", points: 100, isPremium: true)
        let json = try? JSONEncoder().encode(customer)
        
//        let dict: [String: Any] = [
//            "id": "1234",
//            "name": "Doge",
//            "points": 5,
//            "isPremium": true
//        ]
//        let jsonData = try? JSONSerialization.data(withJSONObject: dict)
        
        return json
    }
}

struct CL21Codable: View {
    @StateObject var viewModel = CL21CodableViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            if let customer = viewModel.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
    }
}

struct CL21Codable_Previews: PreviewProvider {
    static var previews: some View {
        CL21Codable()
    }
}
