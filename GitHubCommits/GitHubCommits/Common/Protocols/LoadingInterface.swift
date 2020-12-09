//
//  LoadingInterface.swift
//  GitHubCommits
//
//  Created by OSWALDO GARCIA FABIAN on 12/8/20.
//

import Foundation

protocol LoadingInterface {
    func hideLoading(_ completion: (() -> Void)?)
    func showLoading(_ completion: (() -> Void)?)
}
