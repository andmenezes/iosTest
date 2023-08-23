//
//  LoadingView.swift
//  iOS Carrefour Challenge
//
//  Created by André Menezes on 23/08/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
                
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint:.red))
                .scaleEffect(3)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
