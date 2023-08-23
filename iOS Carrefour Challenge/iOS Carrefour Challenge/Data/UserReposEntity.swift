//
//  UserReposEntity.swift
//  iOS Carrefour Challenge
//
//  Created by André Menezes on 22/08/23.
//

import Foundation
//{
//    "id": 681572840,
//    "name": "iosTest",
//    "private": false
//}
//    "html_url": "https://github.com/andmenezes/iosTest",
//    "language": null,

class UserReposEntity: ObservableObject, Identifiable, Decodable {
    @Published var id: Int = UUID().hashValue
    @Published var name: String = ""
    @Published var isPrivate: Bool = false
    @Published var language: String? = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case isPrivate = "private"
        case language
    }
    
    init() {

    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try values.decode(Int.self, forKey: .id)
        self.name = try values.decode(String.self, forKey: .name)
        self.isPrivate = try values.decode(Bool.self, forKey: .isPrivate)
        self.language = try values.decode(String.self, forKey: .language)
    }
    
    init(json: [String: Any]) {
        if let id = json[CodingKeys.id.rawValue] as? Int {
            self.id = id
        }
        
        if let name = json[CodingKeys.name.rawValue] as? String {
            self.name = name
        }
        
        if let isPrivate = json[CodingKeys.isPrivate.rawValue] as? Bool {
            self.isPrivate = isPrivate
        }
        
        if let language = json[CodingKeys.language.rawValue] as? String {
            self.language = language
        }
    }
}
