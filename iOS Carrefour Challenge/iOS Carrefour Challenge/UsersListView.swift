//
//  UsersListView.swift
//  iOS Carrefour Challenge
//
//  Created by André Menezes on 22/08/23.
//

import SwiftUI

struct UsersListView: View {
    var users: [UserEntity]
    var loadingText: String
    var displayType: DisplayType
    
    var body: some View {
        ScrollView {
            VStack {
                if self.users.count == 0 {
                    Spacer()
                    
                    Text(self.loadingText)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.top, 200)
                        .padding(.horizontal, 20)
                    Spacer()
                    
                } else {
                    ForEach(self.users) { user in
                        UserTileView(user: user, displayType: .list)
                    }
                }
            }
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UsersListView(users: [UserEntity.testEvent1,UserEntity.testEvent2], loadingText: "", displayType: .list)
            UsersListView(users: [], loadingText: "Carregando Usuários", displayType: .list)
            
        }
        
    }
}
