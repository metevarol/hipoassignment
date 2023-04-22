//
//  GitHubUser.swift
//  hipoapp
//
//  Created by Mete Varol on 21.04.2023.
//

import Foundation

struct GitHubUser: Codable {
    let login: String
    let avatar_url: String
    let followers: Int
    let following: Int
}

