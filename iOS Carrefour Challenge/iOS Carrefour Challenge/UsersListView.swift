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
    var isDiscover = false
    
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
//                        NavigationLink(destination: EventDetailView(event: event,
//                                                                    isDiscover: self.isDiscover)) {
                            UserTileView(user: user)
//                        }
//                        .buttonStyle(PlainButtonStyle())
                        
                    }
                }
            }
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UsersListView(users: [UserEntity.testEvent1,UserEntity.testEvent2], loadingText: "")
            UsersListView(users: [], loadingText: "Carregando Usuários")
            
        }
        
    }
}
