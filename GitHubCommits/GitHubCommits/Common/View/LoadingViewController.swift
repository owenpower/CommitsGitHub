//
//  LoadingViewController.swift
//  GitHubCommits
//
//  Created by OSWALDO GARCIA FABIAN on 12/8/20.
//

import UIKit

class LoadingViewController: UIViewController {

    let blackTranparence = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = blackTranparence
        self.view.isOpaque = false
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
