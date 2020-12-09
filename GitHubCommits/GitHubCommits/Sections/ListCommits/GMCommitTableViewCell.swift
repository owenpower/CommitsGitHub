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
        authorNameLabel.text = commitItem.commit?.author?.name
        shaLabel.text = commitItem.commit?.tree?.sha
        commitMessageLabel.text = commitItem.commit?.message
    }

}
