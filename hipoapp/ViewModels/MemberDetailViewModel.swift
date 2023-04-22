//
//  MemberDetailViewModel.swift
//  hipoapp
//
//  Created by Mete Varol on 21.04.2023.
//

import Foundation
import Combine

class MemberDetailViewModel: ObservableObject {
    
    @Published var gitHubUser: GitHubUser?
    @Published var repositories: [Repository] = []

    private var gitHubService = NetworkManager()
    private var cancellables: Set<AnyCancellable> = []
    
   
    
    init(member: Hipo.Member) {
        
        fetchGitHubUser(username: member.github)
        fetchGitHubRepositories(username: member.github)
        
    }
    
    

    private func fetchGitHubUser(username: String) {
        gitHubService.fetchUser(username: username)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .failure(let error):
                    print("Error fetching user: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { user in
                self.gitHubUser = user
            })
            .store(in: &cancellables)
    }

    private func fetchGitHubRepositories(username: String) {
        gitHubService.fetchRepositories(username: username)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .failure(let error):
                    print("Error fetching repositories: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { repositories in
                self.repositories = repositories
            })
            .store(in: &cancellables)
    }
    
    func sortByDate() {
            repositories.sort { lhs, rhs in
                lhs.updated_at > rhs.updated_at
            }
        }
}
