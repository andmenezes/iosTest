//
//  UserDetailEntity.swift
//  iOS Carrefour Challenge
//
//  Created by André Menezes on 22/08/23.
//

import Foundation

//{
//  "login": "andmenezes",
//  "id": 17852122,
//  "node_id": "MDQ6VXNlcjE3ODUyMTIy",
//  "avatar_url": "https://avatars.githubusercontent.com/u/17852122?v=4",
//  "gravatar_id": "",
//  "url": "https://api.github.com/users/andmenezes",
//  "html_url": "https://github.com/andmenezes",
//  "followers_url": "https://api.github.com/users/andmenezes/followers",
//  "following_url": "https://api.github.com/users/andmenezes/following{/other_user}",
//  "gists_url": "https://api.github.com/users/andmenezes/gists{/gist_id}",
//  "starred_url": "https://api.github.com/users/andmenezes/starred{/owner}{/repo}",
//  "subscriptions_url": "https://api.github.com/users/andmenezes/subscriptions",
//  "organizations_url": "https://api.github.com/users/andmenezes/orgs",
//  "repos_url": "https://api.github.com/users/andmenezes/repos",
//  "events_url": "https://api.github.com/users/andmenezes/events{/privacy}",
//  "received_events_url": "https://api.github.com/users/andmenezes/received_events",
//  "type": "User",
//  "site_admin": false,
//  "name": "André Menezes",
//  "company": null,
//  "blog": "",
//  "location": null,
//  "email": null,
//  "hireable": null,
//  "bio": "Working with Software Development for over 15 years, which the last 10 years were working on delivering Mobile iOS solutions to different companies. focusing on",
//  "twitter_username": null,
//  "public_repos": 7,
//  "public_gists": 0,
//  "followers": 3,
//  "following": 3,
//  "created_at": "2016-03-15T13:31:04Z",
//  "updated_at": "2023-08-01T14:35:39Z"
//}

class UserDetailEntity: ObservableObject, Identifiable, Decodable {
    var id: Int = UUID().hashValue
    var name: String = ""
    var bio: String = ""
    var publicRepos: Int = 0
    var followers: Int = 0
    var following: Int = 0
    var createdAt: Date = Date()
    var updatedAt: Date = Date()
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case bio
        case publicRepos = "public_repos"
        case followers
        case following
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    init() {

    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try values.decode(Int.self, forKey: .id)
        self.name = try values.decode(String.self, forKey: .name)
        self.bio = try values.decode(String.self, forKey: .bio)
        self.publicRepos = try values.decode(Int.self, forKey: .publicRepos)
        self.followers = try values.decode(Int.self, forKey: .followers)
        self.following = try values.decode(Int.self, forKey: .following)
        self.createdAt = try values.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try values.decode(Date.self, forKey: .updatedAt)
    }
}
