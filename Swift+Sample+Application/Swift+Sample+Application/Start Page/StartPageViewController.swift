//
//  StartPageViewController.swift
//  Swift+Sample+Application
//
//  Created by Suhas G on 25/01/22.
//

import UIKit

class StartPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func coreSDKTapped(_ sender: Any) {
        let viewController = CoreSDKViewController(nibName: "CoreSDKViewController", bundle: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
