//
//  LoadingManager.swift
//  GitHubCommits
//
//  Created by OSWALDO GARCIA FABIAN on 12/8/20.
//

import UIKit

class LoadingManager {
    
    private var parentVC : UIViewController!
    private var popVC : LoadingViewController?
    
    init (_ parentVC: UIViewController){
        self.parentVC = parentVC
    }
    
    func showLoading(_ completion: (() -> Void)? = nil) {
        if popVC == nil {
            popVC = UIStoryboard(name: "Loading", bundle: nil).instantiateViewController(withIdentifier: "loading") as? LoadingViewController
            
        }
        setView(completion)
    }
    
    private func setView(_ completion: (() -> Void)? = nil) {
        if let popVC = popVC {
            popVC.view.frame = parentVC.view.frame
            popVC.modalPresentationStyle = .overCurrentContext
            parentVC.navigationController?.present(popVC, animated: true, completion: completion)
        }
    }
    
    func hideLoading(_ completion: (() -> Void)? = nil) {
         if let popVC = popVC {
            popVC.dismiss(animated: true, completion: completion)
            self.popVC = nil
        }
    }
}
