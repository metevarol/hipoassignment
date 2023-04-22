//
//  MembersViewModel.swift
//  hipoapp
//
//  Created by Mete Varol on 21.04.2023.
//

import Foundation
import SwiftUI
import Combine

class MembersViewModel: ObservableObject {
    @Published var members: [Hipo.Member] = []
    @Published var searchText: String = ""
    @Published var filteredMembers: [Hipo.Member] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(members: [Hipo.Member]) {
        self.members = members
        
        $searchText
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] searchText in
                self?.filterMembers(searchText: searchText)
            }
            .store(in: &cancellables)
    }
    
    private func filterMembers(searchText: String) {
        if searchText.isEmpty {
            filteredMembers = members
        } else {
            filteredMembers = members.filter { member in
                member.name.lowercased().contains(searchText.lowercased()) ||
                member.hipo.position.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    func sortMembers() {
        let character: Character = "a"
        filteredMembers.sort { member1, member2 in
            let lastName1 = member1.name.split(separator: " ").last?.lowercased() ?? ""
            let lastName2 = member2.name.split(separator: " ").last?.lowercased() ?? ""

            let count1 = lastName1.occurrences(of: character)
            let count2 = lastName2.occurrences(of: character)

            if count1 != count2 {
                return count1 > count2
            } else if lastName1.count != lastName2.count {
                return lastName1.count < lastName2.count
            } else {
                return lastName1 < lastName2
            }
        }
    }
    
    func addMember(_ newMember: Hipo.Member) {
            members.append(newMember)
        filterMembers(searchText: searchText)
        }
    
    func deleteMember(at offsets: IndexSet) {
            for index in offsets {
                members.remove(at: index)
            }
        filterMembers(searchText: searchText)
        }

}
