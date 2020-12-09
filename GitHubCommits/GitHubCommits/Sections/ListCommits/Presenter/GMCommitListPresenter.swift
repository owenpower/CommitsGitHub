//
//  GMCommitListPresenter.swift
//  GitHubCommits
//
//  Created by OSWALDO GARCIA FABIAN on 12/8/20.
//

import Foundation

protocol GMCommitsInterface: LoadingInterface {
    func resultCommits(_ commits: [CommitItem])
}

protocol GMCommitsModuleInterface {
    func getListCommits()
}

class GMCommitListPresenter {
    var commitListInterface: GMCommitsInterface!
    
    init(_ commitListInterface: GMCommitsInterface) {
        self.commitListInterface = commitListInterface
    }
    
}

extension GMCommitListPresenter: GMCommitsModuleInterface {
    func getListCommits() {
        self.commitListInterface.showLoading() {
            GMCommitsService.shared.getCommits { [weak self] commits in
                guard let self = self else {
                    return
                }
                self.commitListInterface.hideLoading() {
                    DispatchQueue.main.async {
                        self.commitListInterface.resultCommits(commits)
                    }
                }
            }
        }
    }
}
