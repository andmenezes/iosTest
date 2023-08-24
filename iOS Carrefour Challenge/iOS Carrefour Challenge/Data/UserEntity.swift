//
//  UserEntity.swift
//  iOS Carrefour Challenge
//
//  Created by André Menezes on 22/08/23.
//

import Foundation
import SwiftUI

class UserEntity: ObservableObject, Identifiable, Decodable {
    @Published var id: Int = UUID().hashValue
    @Published var userName: String = ""
    @Published var avatarURL: String = ""
    @Published var avatarImageData: Data?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userName = "login"
        case avatarURL = "avatar_url"
    }
    
    init() {

    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try values.decode(Int.self, forKey: .id)
        self.userName = try values.decode(String.self, forKey: .userName)
        self.avatarURL = try values.decode(String.self, forKey: .avatarURL)
    }
    
    init(json: [String: Any]) {
        if let id = json[CodingKeys.id.rawValue] as? Int {
            self.id = id
        }
        
        if let userName = json[CodingKeys.userName.rawValue] as? String {
            self.userName = userName
        }
        
        if let imageUrl = json[CodingKeys.avatarURL.rawValue] as? String {
            if let url = URL(string: imageUrl) {
                if let data = try? Data(contentsOf: url) {
                    self.avatarImageData = data
                }
            }
        }
    }
}

extension UserEntity {
    static var testEvent1: UserEntity {
        let user = UserEntity()

        user.userName = "andMenezes"
        user.avatarURL = "https://avatars.githubusercontent.com/u/17852122?v=4"
        
        if let image = UIImage(named: "avatarTestImage"), let data = image.pngData() {
            user.avatarImageData = data
        }

        return user
    }

    static var testEvent2: UserEntity {
        let user = UserEntity()

        user.userName = "andMenezes"
        user.avatarURL = "https://avatars.githubusercontent.com/u/17852122?v=4"
        
        if let image = UIImage(named: "avatarTestImage"), let data = image.pngData() {
            user.avatarImageData = data
        }

        return user
    }
}

