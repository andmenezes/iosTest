//
//  UserEntity.swift
//  iOS Carrefour Challenge
//
//  Created by André Menezes on 22/08/23.
//

import Foundation
import SwiftUI

//{
//   "login": "vanpelt",
//   "id": 17,
//   "node_id": "MDQ6VXNlcjE3",
//   "avatar_url": "https://avatars.githubusercontent.com/u/17?v=4",
//   "gravatar_id": "",
//   "url": "https://api.github.com/users/vanpelt",
//   "html_url": "https://github.com/vanpelt",
//   "followers_url": "https://api.github.com/users/vanpelt/followers",
//   "following_url": "https://api.github.com/users/vanpelt/following{/other_user}",
//   "gists_url": "https://api.github.com/users/vanpelt/gists{/gist_id}",
//   "starred_url": "https://api.github.com/users/vanpelt/starred{/owner}{/repo}",
//   "subscriptions_url": "https://api.github.com/users/vanpelt/subscriptions",
//   "organizations_url": "https://api.github.com/users/vanpelt/orgs",
//   "repos_url": "https://api.github.com/users/vanpelt/repos",
//   "events_url": "https://api.github.com/users/vanpelt/events{/privacy}",
//   "received_events_url": "https://api.github.com/users/vanpelt/received_events",
//   "type": "User",
//   "site_admin": false
// }

class UserEntity: ObservableObject, Identifiable, Decodable {
    @Published var id: Int = UUID().hashValue
    @Published var userName: String = ""
    @Published var avatarURL: String = ""
    @Published var avatarData: Data?
    
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
                    self.avatarData = data
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
            user.avatarData = data
        }

        return user
    }

    static var testEvent2: UserEntity {
        let user = UserEntity()

        user.userName = "andMenezes"
        user.avatarURL = "https://avatars.githubusercontent.com/u/17852122?v=4"
        
        if let image = UIImage(named: "avatarTestImage"), let data = image.pngData() {
            user.avatarData = data
        }

        return user
    }
}

