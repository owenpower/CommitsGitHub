//
//  GMCommitListViewController.swift
//  GitHubCommits
//
//  Created by OSWALDO GARCIA FABIAN on 12/8/20.
//

import UIKit

class GMCommitListViewController: BaseViewController {
    
    @IBOutlet var tableView: UITableView!
    var commitList = [CommitItem]()
    var presenter: GMCommitsModuleInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = GMCommitListPresenter(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getListCommits()
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

extension GMCommitListViewController: GMCommitsInterface {
    func resultCommits(_ commits: [CommitItem]) {
        self.commitList = commits
        self.tableView.reloadData()
    }
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
