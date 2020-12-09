//
//  GMCommitListViewController.swift
//  GitHubCommits
//
//  Created by OSWALDO GARCIA FABIAN on 12/8/20.
//

import UIKit

class GMCommitListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var commitList = [CommitItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        GMCommitsService.shared.getCommits { [weak self] commits in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                self.commitList = commits
                self.tableView.reloadData()
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GMCommitListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        commitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GMCommitTableViewCell.identifier, for: indexPath) as! GMCommitTableViewCell
        cell.setCommit(commitList[indexPath.row])
        return cell
    }
    
    
}
