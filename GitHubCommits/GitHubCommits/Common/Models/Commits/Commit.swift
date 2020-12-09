//
//  Commit.swift
//  GitHubCommits
//
//  Created by OSWALDO GARCIA FABIAN on 12/8/20.
//

import Foundation

struct Commit: Codable {
    let author: Author?
    let message: String?
    let tree: Tree?
}
