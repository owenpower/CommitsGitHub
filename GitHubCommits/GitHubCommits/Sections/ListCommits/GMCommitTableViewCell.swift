//
//  GMCommitTableViewCell.swift
//  GitHubCommits
//
//  Created by OSWALDO GARCIA FABIAN on 12/8/20.
//

import UIKit

class GMCommitTableViewCell: UITableViewCell {
    
    static let identifier = "commitCell"
    
    @IBOutlet var authorNameLabel: UILabel!
    @IBOutlet var shaLabel: UILabel!
    @IBOutlet var commitMessageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCommit(_ commitItem: CommitItem) {
        authorNameLabel.text = "Author: \(commitItem.commit?.author?.name ?? String())"
        shaLabel.text = "Sha: \(commitItem.commit?.tree?.sha ?? String())"
        commitMessageLabel.text = "Messsage: \n \(commitItem.commit?.message ?? String())"
    }

}
