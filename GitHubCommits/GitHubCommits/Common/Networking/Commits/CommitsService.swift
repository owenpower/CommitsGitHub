//
//  CommitsService.swift
//  GitHubCommits
//
//  Created by OSWALDO GARCIA FABIAN on 12/8/20.
//

import Foundation

struct GMCommitsService {
    let url = "https://api.github.com/repos/jshier/Alamofire/commits"
    
    public static let shared = GMCommitsService()
    
    private init() {}
    
    func getCommits(completion: @escaping ([CommitItem]) -> Void) {
        GMServiceManager.shared.request(url) { (result: Result<[CommitItem], GMServiceManager.ServiceError>) in
            switch result {
            case .success(let commits):
                completion(commits)
            case .failure(let error):
                completion([CommitItem]())
                print(error.localizedDescription)
            }
        }
    }
}
