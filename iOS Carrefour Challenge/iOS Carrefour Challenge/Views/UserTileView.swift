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
    
    var displayType: DisplayType

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
                .frame(height: displayType == .list ? 15 : 5)

            HStack {
                Text(self.user.userName)
                    .font(self.font())
                    .padding(5)
                Spacer()
            }
            .background(backgroundColor)
        }
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
    
    func font() -> Font {
        if self.displayType == .list {
            return .title
        }
        return .body
    }
    
}

struct UserTileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserTileView(user: UserEntity.testEvent1, displayType: .list)
            UserTileView(user: UserEntity.testEvent1, displayType: .grid)
        }
        
    }
}
