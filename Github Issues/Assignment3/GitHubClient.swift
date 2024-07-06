//
//  GitHubClient.swift
//  Assignment3
//
//  Created by Yutong Sun on 1/24/24.
//

import Foundation

struct GithubIssue: Codable {
    let title: String?
    let createdAt: String
    let body: String?
    let state: String
    let user: GitHubUser
    let htmlUrl: String
}

struct GitHubUser:Codable {
    let login: String
}

class GitHubClient {
    enum IssuesFetcherError: Error {
        case invalidURL
        case badResponse
    }
    
    func fetchOpenIssues() async throws -> [GithubIssue] {
        
        guard let url = URL(string: "https://api.github.com/repos/privacy-scaling-explorations/maci/issues?state=open") else {
            throw IssuesFetcherError.invalidURL
        }
        
        // Use the async variant of URLSession to fetch data
        // Code might suspend here
        let (data, response) = try await URLSession.shared.data(from: url)
  
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw IssuesFetcherError.badResponse
        }
        
        // Parse the JSON data
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedIssues = try decoder.decode([GithubIssue].self, from: data)
        return decodedIssues
    }
    
    func fetchClosedIssues() async throws -> [GithubIssue] {
        
        guard let url = URL(string: "https://api.github.com/repos/privacy-scaling-explorations/maci/issues?state=closed") else {
            throw IssuesFetcherError.invalidURL
        }
        
        // Use the async variant of URLSession to fetch data
        // Code might suspend here
        let (data, response) = try await URLSession.shared.data(from: url)
  
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw IssuesFetcherError.badResponse
        }
        
        // Parse the JSON data
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedIssues = try decoder.decode([GithubIssue].self, from: data)
        return decodedIssues
    }
    
}
