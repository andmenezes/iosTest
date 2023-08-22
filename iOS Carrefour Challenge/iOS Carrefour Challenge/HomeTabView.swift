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
                Image(systemName: "person.fill")
                Text("Lista de Usuários")
            }
            NavigationView {
                UsersTabView(displayType: .grid)
            }
            .tabItem {
                Image(systemName: "rectangle.grid.3x2")
                Text("Grid de Usuários")
            }
            NavigationView {
                Text("Sobre o App")
            }
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("Sobre o App")
                }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
