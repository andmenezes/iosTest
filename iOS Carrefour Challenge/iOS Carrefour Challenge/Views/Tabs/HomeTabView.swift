//
//  HomeTabView.swift
//  iOS Carrefour Challenge
//
//  Created by André Menezes on 22/08/23.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            NavigationView {
                UsersTabView()
            }
            .tabItem {
                Image(systemName: String.systemImages.personFill)
                Text(String.hardedCode.usersList)
            }
            NavigationView {
                UsersTabView(displayType: .grid)
            }
            .tabItem {
                Image(systemName: String.systemImages.rectangleGrid)
                Text(String.hardedCode.usersGrid)
            }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
