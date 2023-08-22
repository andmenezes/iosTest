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
    
    func getDiscoveryEventsAPiData() {
        if let url = URL(string: "https://api.github.com/users") {
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
                        }
                    }
                }
            }.resume()
        }
        
        
    }
    
}

