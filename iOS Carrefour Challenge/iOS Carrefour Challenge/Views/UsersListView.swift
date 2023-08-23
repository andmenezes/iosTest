//
//  UsersListView.swift
//  iOS Carrefour Challenge
//
//  Created by André Menezes on 22/08/23.
//

import SwiftUI

struct UsersListView: View {
    var users: [UserEntity]
    var displayType: DisplayType
    
    var body: some View {
        ScrollView {
            VStack {
                
                ForEach(self.users) { user in
                    NavigationLink(destination: UserDetailView(user: user)) {
                        UserTileView(user: user, displayType: .list)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
            }
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UsersListView(users: [UserEntity.testEvent1,UserEntity.testEvent2], displayType: .list)
            UsersListView(users: [], displayType: .list)
        }
    }
}
