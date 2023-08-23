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
    
    var body: some View {
        ZStack {
            if displayType == .list {
                UsersListView(users: self.data.usersArray, displayType: self.displayType)
                
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
                
                UsersGridView(users: self.data.usersArray, displayType: .grid)
                
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
        .onAppear {
            self.getUsersAPIData()
        }
    }
    
    func reloadData() {
        self.data.usersArray = []
        self.getUsersAPIData()
    }
    
    func getUsersAPIData() {
        if self.data.usersArray.count == 0 {
            RequestManager.shared.getUsersAPIData()
        }
    }
}

struct UsersTabView_Previews: PreviewProvider {
    static var previews: some View {
        UsersTabView()
    }
}


