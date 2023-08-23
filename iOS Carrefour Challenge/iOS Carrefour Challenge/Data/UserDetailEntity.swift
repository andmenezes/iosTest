//
//  UserDetailEntity.swift
//  iOS Carrefour Challenge
//
//  Created by André Menezes on 22/08/23.
//

import Foundation

class UserDetailEntity: ObservableObject, Identifiable, Decodable {
    var id: Int = UUID().hashValue
    var name: String = ""
    var bio: String = ""
    var publicRepos: Int = 0
    var followers: Int = 0
    var following: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case bio
        case publicRepos = "public_repos"
        case followers
        case following
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
    }
    
    init(json: [String: Any]) {
        if let id = json[CodingKeys.id.rawValue] as? Int {
            self.id = id
        }
        
        if let name = json[CodingKeys.name.rawValue] as? String {
            self.name = name
        }
        
        if let bio = json[CodingKeys.bio.rawValue] as? String {
            self.bio = bio
        }
        
        if let publicRepos = json[CodingKeys.publicRepos.rawValue] as? Int {
            self.publicRepos = publicRepos
        }
        
        if let followers = json[CodingKeys.followers.rawValue] as? Int {
            self.followers = followers
        }
        
        if let following = json[CodingKeys.following.rawValue] as? Int {
            self.following = following
        }
    }
}

extension UserDetailEntity {
    static var userDetailTestEvent1: UserDetailEntity {
        let userDetail = UserDetailEntity()
        userDetail.name = "andMenezes"
        userDetail.bio = "Working with Software Development for over 15 years, which the last 10 years were working on delivering Mobile iOS solutions to different companies. focusing on"
        userDetail.followers = 3
        userDetail.following = 3
        userDetail.publicRepos = 7
        
        return userDetail
    }
}

