//
//  UsersTabView.swift
//  iOS Carrefour Challenge
//
//  Created by André Menezes on 22/08/23.
//

import SwiftUI

enum DisplayType {
    case list
    case grid
}

struct UsersTabView: View {
    @ObservedObject var data = RequestManager.shared
    var displayType: DisplayType = .list
    
    var body: some View {
        if displayType == .list {
            UsersListView(users: self.data.usersArray, loadingText: "Estamos carregando os usuários 🤘🏻", displayType: self.displayType)
            
                .navigationTitle("Github Users")
                .navigationBarItems(trailing:
                                        Button(action: {
                    data.getUsersAPiData()
                }) {
                    Image(systemName: "arrow.clockwise")
                        .font(.body)
                }
                )
            
        } else {
            
            UsersGridView(users: self.data.usersArray, loadingText: "Estamos carregando os usuários 🤘🏻", displayType: .grid)
            
                .navigationTitle("Github Users")
                .navigationBarItems(trailing:
                                        Button(action: {
                    data.getUsersAPiData()
                }) {
                    Image(systemName: "arrow.clockwise")
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
