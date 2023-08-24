//
//  Strings.swift
//  iOS Carrefour Challenge
//
//  Created by André Menezes on 22/08/23.
//

import Foundation

extension String {
    struct hardedCode {
        static let gitHubUsers = "Github Users"
        static let usersList = "Lista de Usuários"
        static let usersGrid = "Grid de Usuários"
        static let aboutApp = "Sobre o App"
        static let bio = "Biografia resumida: "
        static let publicRepos = "Repositórios publicos: "
        static let followers = "Seguidores: "
        static let following = "Seguindo: "
    }
    
    struct endPoints {
        static let getUsers = "https://api.github.com/users"
        static func getUserDetail(_ userName: String) -> String {
            return "https://api.github.com/users/\(userName)"
        }
        static func getUserRepos(_ userName: String) -> String {
            return "https://api.github.com/users/\(userName)/repos"
        }
    }
    
    struct systemImages {
        static let personFill = "person.fill" // 􀉪
        static let rectangleGrid = "rectangle.grid.3x2" // 􀇶
        static let infoCircleFill = "info.circle.fill" // 􀅵
        static let arrowClockwise = "arrow.clockwise" // 􀅈
        static let chevronLeft = "chevron.compact.left" // 􀆒
        static let chevronRight = "chevron.compact.right" // 􀆓
    }
}
