//
//  PaylaterViewController.swift
//  Swift+Sample+Application
//
//  Created by Suhas G on 22/03/22.
//

import UIKit
import CashfreePGCoreSDK
import CashfreePG

class PaylaterViewController: UIViewController {

    @IBOutlet weak var providerTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    private let pgService = CFPaymentGatewayService.getInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pgService.setCallback(self)
        // Do any additional setup after loading the view.
        if Utils.environment == .SANDBOX {
            self.providerTextField.text = "lazypay"
            self.phoneNumberTextField.text = "99999999"
        }
    }

    @IBAction func payButtonTapped(_ sender: Any) {
        DispatchQueue.main.async {
            do {
                let session = try CFSession.CFSessionBuilder()
                    .setEnvironment(Utils.environment)
                    .setOrderID(Utils.order_id)
                    .setOrderToken(Utils.order_token)
                    .build()
                let payLater = try CFPaylater.CFPaylaterBuilder()
                    .setProvider(self.providerTextField.text ?? "")
                    .setPhone(self.phoneNumberTextField.text ?? "")
                    .build()
                let payLaterPayment = try CFPaylaterPayment.CFPaylaterPaymentBuilder()
                    .setSession(session)
                    .setPaylater(payLater)
                    .build()
                self.pgService.setCallback(self)
                try self.pgService.doPayment(payLaterPayment, viewController: nil)
            } catch let e {
                let error = e as! CashfreeError
                print(error.localizedDescription)
            }
        }
    }
}

extension PaylaterViewController: CFPaylaterPaymentDelegate {
    func initiatingPaylaterPayment() {
        // Show Loader here
    }
    
    func presentWebForAuthenticatingPaylaterPayment() {
        // Present web for authentication here
        DispatchQueue.main.async {
            let webView = WebViewController(nibName: "WebViewController", bundle: nil)
            webView.modalPresentationStyle = .fullScreen
            self.present(webView, animated: true, completion: nil)
        }
    }
    
    func verifyPaylaterPaymentCompletion(for orderId: String) {
        // Start verification here
        DispatchQueue.main.async {
            // Dismissing the web-view
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func payLaterPayment(didFinishExecutingWith error: CFErrorResponse) {
        // Handle Errors here
    }
    
    
}
