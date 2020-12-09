//
//  BaseViewController.swift
//  GitHubCommits
//
//  Created by OSWALDO GARCIA FABIAN on 12/8/20.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var loadingManager : LoadingManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingManager = LoadingManager.init(self)
    }
    
    func hideLoading(_ completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            self.loadingManager.hideLoading(completion)
        }
    }
    
    func showLoading(_ completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            self.loadingManager.showLoading(completion)
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
