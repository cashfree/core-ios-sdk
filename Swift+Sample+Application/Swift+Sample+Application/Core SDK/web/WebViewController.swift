//
//  WebViewController.swift
//  Swift+Sample+Application
//
//  Created by Suhas G on 08/07/21.
//

import UIKit
import WebKit
import CashfreePGCoreSDK

class WebViewController: UIViewController {
    
    var cashfreeWebView: CFWebView!
    @IBOutlet var cfWebView: CFWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try self.cfWebView.startAuthentication()
        } catch {
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        // NOTE:-
        // If the application allows the user to shut down the web-view without making payment.
        // Then, we strongly recommend you to call the below code so that the application avoids getting unncessary callback even the payment flow is completed.
        self.cfWebView.removeWebViewReference()
        self.dismiss(animated: true, completion: nil)
    }

}
