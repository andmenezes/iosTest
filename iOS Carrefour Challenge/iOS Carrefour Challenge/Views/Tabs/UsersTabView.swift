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
        if displayType == .list {
            UsersListView(users: self.data.usersArray, loadingText: String.hardedCode.loadingUsers, displayType: self.displayType)
            
                .navigationTitle(String.hardedCode.gitHubUsers)
                .navigationBarItems(trailing:
                                        Button(action: {
                    data.getUsersAPiData()
                }) {
                    Image(systemName: String.systemImages.arrowClockwise)
                        .font(.body)
                }
                )
            
        } else {
            
            UsersGridView(users: self.data.usersArray, loadingText: String.hardedCode.loadingUsers, displayType: .grid)
            
                .navigationTitle(String.hardedCode.gitHubUsers)
                .navigationBarItems(trailing:
                                        Button(action: {
                    data.getUsersAPiData()
                }) {
                    Image(systemName: String.systemImages.arrowClockwise)
                        .font(.body)
                }
                )
        }
    }
}

struct UsersTabView_Previews: PreviewProvider {
    static var previews: some View {
        UsersTabView()
    }
}
