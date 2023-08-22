//
//  iOS_Carrefour_ChallengeApp.swift
//  iOS Carrefour Challenge
//
//  Created by André Menezes on 22/08/23.
//

import SwiftUI

@main
struct iOS_Carrefour_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .onAppear(perform: {
                    RequestManager.shared.getUsersAPiData()
                })
        }
    }
}
