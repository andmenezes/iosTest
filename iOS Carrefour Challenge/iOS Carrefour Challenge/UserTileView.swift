//
//  UserTileView.swift
//  iOS Carrefour Challenge
//
//  Created by André Menezes on 22/08/23.
//

import SwiftUI

struct UserTileView: View {
    
    @Environment(\.colorScheme) var colorScheme

    @ObservedObject var user: UserEntity

    var body: some View {

        let isDarkMode = colorScheme == .dark
        let darkBackgroundColor: Color = Color(.systemGray6)
        let backgroundColor: Color = isDarkMode ? darkBackgroundColor : .white
        
        VStack(spacing: 0) {

            if let imageData = self.user.avatarData,
               let uiImage = UIImage(data: imageData)
            {
                let image = Image(uiImage: uiImage)
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }

            Rectangle()
                .foregroundColor(.orange)
                .frame(height: 15)

            HStack {
                Text(self.user.userName)
                    .font(.title)
                    .padding(10)
                Spacer()
            }
            .background(backgroundColor)
        }
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
}

struct UserTileView_Previews: PreviewProvider {
    static var previews: some View {
        UserTileView(user: UserEntity.testEvent1)
    }
}
