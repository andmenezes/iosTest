//
//  UserDetailView.swift
//  iOS Carrefour Challenge
//
//  Created by André Menezes on 23/08/23.
//

import SwiftUI

struct UserDetailView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var user: UserEntity
    @ObservedObject var data = RequestManager.shared
    
    
    private let verticalSpacing: CGFloat = 5
    
    
    var body: some View {
        let isDarkMode = colorScheme == .dark
        let darkBackgroundColor: Color = Color(.systemGray6)
        let backgroundColor: Color = isDarkMode ? darkBackgroundColor : .white
        
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    
                    if let imageData = self.user.avatarData,
                       let uiImage = UIImage(data: imageData)
                    {
                        let image = Image(uiImage: uiImage)
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        Rectangle()
                            .foregroundColor(.orange)
                            .frame(height: 15)
                    }
                    HStack {
                        Spacer()
                        Text(self.user.userName)
                            .font(.title)
                            .padding(10)
                        Spacer()
                    }
                    .background(backgroundColor)
                    
                    Divider()
                    
                    //                ScrollView {
                    if !self.data.userDetail.bio.isEmpty {
                        
                        VStack {
                            HStack {
                                Text("Biografia resumida: ")
                                    .font(.title2)
                                    .padding()
                                Spacer()
                            }
                            
                            HStack {
                                Text("\(self.data.userDetail.bio)")
                                    .font(.title3)
                                    .padding()
                                    .multilineTextAlignment(.leading)
                                Spacer()
                                
                            }
                            Divider()
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("Repositórios publicos: \(self.data.userDetail.publicRepos)")
                                .font(.title2)
                                .padding()
                                .padding(.leading, 5)
                            
                            Spacer()
                        }
                        
                        Divider()
                        HStack {
                            
                            Text("Seguidores: \(self.data.userDetail.followers)")
                                .font(.title2)
                                .padding()
                            
                            Divider()
                                .padding(.leading, 15)
                            
                            Text("Seguindo: \(self.data.userDetail.following)")
                                .font(.title2)
                                .padding(.leading, 15)
                            Spacer()
                        }
                        .padding(.leading, 5)
                    }
                    Divider()
                    //                }
                }
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    self.getUserDetailInfo()
                }
            }
            
            if self.data.isLoading {
                LoadingView()
            }
        }
        
    }
    
    func getUserDetailInfo() {
        RequestManager.shared.getUserDetailsAPIData(userName: self.user.userName)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: UserEntity.testEvent1, data: RequestManager.userDetailTestEvent1)
    }
}
