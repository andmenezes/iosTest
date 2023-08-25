//
//  RequestManager.swift
//  iOS Carrefour Challenge
//
//  Created by André Menezes on 22/08/23.
//

import Foundation

class RequestManager: ObservableObject {
    static var shared = RequestManager()
    
    @Published var usersArray: [UserEntity] = []
    @Published var searchUserArray: [UserEntity] = []
    @Published var userDetail: UserDetailEntity = UserDetailEntity()
    @Published var usersReposArray: [UserReposEntity] = []
    @Published var isLoading: Bool = false
    
    func getUsersAPIData() {
        self.isLoading = true
        if let url = URL(string: String.endPoints.getUsers) {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let webData = data {
                    if let json = try? JSONSerialization.jsonObject(with: webData) as? [[String: Any]] {
                        var usersArrayToAdd: [UserEntity] = []
                        
                        for eventJSON in json {
                            
                            let user = UserEntity(json: eventJSON)
                            usersArrayToAdd.append(user)
                        }
                        
                        DispatchQueue.main.async {
                            self.usersArray = usersArrayToAdd
                            self.isLoading = false
                        }
                    }
                }
            }.resume()
        }
    }
    
    func getUserDetailsAPIData(userName: String) {
        self.isLoading = true
        if let url = URL(string: String.endPoints.getUserDetail(userName)) {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let webData = data {
                    if let json = try? JSONSerialization.jsonObject(with: webData) as? [String: Any] {
                        DispatchQueue.main.async {
                            self.userDetail = UserDetailEntity(json: json)
                            self.getUserReposAPIData(userName: userName)
                        }
                    }
                }
            }.resume()
        }
    }
    
    func getUserReposAPIData(userName: String) {
        self.isLoading = true
        if let url = URL(string: String.endPoints.getUserRepos(userName)) {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let webData = data {
                    if let json = try? JSONSerialization.jsonObject(with: webData) as? [[String: Any]] {
                        var usersReposToAdd: [UserReposEntity] = []
                        
                        for eventJSON in json {
                            
                            let user = UserReposEntity(json: eventJSON)
                            usersReposToAdd.append(user)
                        }
                        
                        DispatchQueue.main.async {
                            self.usersReposArray = usersReposToAdd
                            self.isLoading = false
                        }
                    }
                }
            }.resume()
        }
    }
    
    func searchApiForUser(userName: String) {
        self.isLoading = true
        self.searchUserArray = []
        
        if let url = URL(string: String.endPoints.searchUserByName(userName)) {
            
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let webData = data {
                    if let json = try? JSONSerialization.jsonObject(with: webData) as? [String: Any] {
                        if let items = json["items"] as? [[String: Any]] {
                            var usersArrayToAdd: [UserEntity] = []
                            
                            for eventJSON in items {
                                
                                let user = UserEntity(json: eventJSON)
                                usersArrayToAdd.append(user)
                            }
                            
                            DispatchQueue.main.async {
                                self.isLoading = false
                                self.searchUserArray = usersArrayToAdd
                            }
                        }
                    }
                }
            }.resume()
        }
    }
}

extension RequestManager {
    static var userDetailTestEvent1: RequestManager {
        let request = RequestManager()
        let userDetail = UserDetailEntity.userDetailTestEvent1
        request.userDetail = userDetail
        
        return request
    }
}

