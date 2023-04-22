//
//  AddMemberViewModel.swift
//  hipoapp
//
//  Created by Mete Varol on 22.04.2023.
//

import Foundation
import SwiftUI
import Combine

class AddMemberViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var github: String = ""
    @Published var position: String = ""
    @Published var yearsInHipo: Int = 0
    
    func addMember(completion: (Hipo.Member) -> Void) {
        let hipoInfo = Hipo.HipoInfo(position: position, years_in_hipo: yearsInHipo)
        let newMember = Hipo.Member(name: name, github: github, hipo: hipoInfo)
        completion(newMember)
    }
}
