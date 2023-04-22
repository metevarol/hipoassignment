//
//  Hipo.swift
//  hipoapp
//
//  Created by Mete Varol on 21.04.2023.
//

import Foundation

struct Hipo: Codable {
    let company: String
    let team: String
    let members: [Member]

    struct Member: Codable, Identifiable {
        var id = UUID()
        let name: String
        let github: String
        let hipo: HipoInfo
    }

    struct HipoInfo: Codable {
        let position: String
        let years_in_hipo: Int
    }
}
