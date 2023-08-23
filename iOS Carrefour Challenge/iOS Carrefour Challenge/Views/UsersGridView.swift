//
//  UsersGridView.swift
//  iOS Carrefour Challenge
//
//  Created by André Menezes on 22/08/23.
//

import SwiftUI

struct UsersGridView: View {
    var users: [UserEntity]
    var displayType: DisplayType
    
    var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 500), spacing: 0),
        GridItem(.adaptive(minimum: 500), spacing: 0),
        GridItem(.adaptive(minimum: 500), spacing: 0)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(self.users) { user in
                    NavigationLink(destination: UserDetailView(user: user)) {
                        UserTileView(user: user, displayType: .grid)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct UsersGridView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UsersGridView(users: [UserEntity.testEvent1,UserEntity.testEvent2], displayType: .grid)
            UsersGridView(users: [], displayType: .grid)
            
        }
    }
}
