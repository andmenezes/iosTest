//
//  UsersTabView.swift
//  iOS Carrefour Challenge
//
//  Created by André Menezes on 22/08/23.
//

import SwiftUI

struct UsersTabView: View {
    @ObservedObject var data = RequestManager.shared
    var displayType: DisplayType = .list
    @State private var searchTerm = ""
    
    var usersToShow: [UserEntity] {
        
        guard self.searchTerm.count > 0 else {
            return self.data.usersArray
        }
        
        if self.data.searchUserArray.count > 0 {
            return self.data.searchUserArray
        }else {
            return self.data.usersArray
        }
    }
    
    var body: some View {
        ZStack {
            if displayType == .list {
                UsersListView(users: self.usersToShow, displayType: self.displayType)
                
                    .navigationTitle(String.hardedCode.gitHubUsers)
                    .navigationBarItems(trailing:
                                            Button(action: {
                        
                        self.reloadData()
                    }) {
                        Image(systemName: String.systemImages.arrowClockwise)
                            .font(.body)
                    }
                    )
                
            } else {
                
                UsersGridView(users: self.usersToShow, displayType: .grid)
                
                    .navigationTitle(String.hardedCode.gitHubUsers)
                    .navigationBarItems(trailing:
                                            Button(action: {
                        self.reloadData()
                    }) {
                        Image(systemName: String.systemImages.arrowClockwise)
                            .font(.body)
                    }
                    )
            }
            
            if self.data.isLoading {
                LoadingView()
            }
        }
        .searchable(text: $searchTerm, prompt: "Digite o nome do usuário")
        .onSubmit(of: .search) {
            self.searchApiForUser(userName: self.searchTerm)
        }
        
        .onAppear {
            self.getUsersAPIData()
        }
    }
    
    func reloadData() {
        self.data.usersArray = []
        self.searchTerm = ""
        self.getUsersAPIData()
    }
    
    func getUsersAPIData() {
        if self.data.usersArray.count == 0 {
            RequestManager.shared.getUsersAPIData()
        }
    }
    
    func searchApiForUser(userName: String) {
        RequestManager.shared.searchApiForUser(userName: userName)
    }
}

struct UsersTabView_Previews: PreviewProvider {
    static var previews: some View {
        UsersTabView()
    }
}


