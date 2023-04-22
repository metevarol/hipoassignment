//
//  GitHubService.swift
//  hipoapp
//
//  Created by Mete Varol on 21.04.2023.
//

import Foundation
import Combine

class NetworkManager{
    private let baseURL = "https://api.github.com"

    func fetchUser(username: String) -> AnyPublisher<GitHubUser, Error> {
        let url = URL(string: "\(baseURL)/users/\(username)")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: GitHubUser.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func fetchRepositories(username: String) -> AnyPublisher<[Repository], Error> {
        let url = URL(string: "\(baseURL)/users/\(username)/repos")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Repository].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
