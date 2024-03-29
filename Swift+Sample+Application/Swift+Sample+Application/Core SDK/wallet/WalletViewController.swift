//
//  WalletViewController.swift
//  Swift+Sample+Application
//
//  Created by Suhas G on 25/01/22.
//

import UIKit
import CashfreePG
import CashfreePGCoreSDK

class WalletViewController: UIViewController {
    
    
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var channelTextField: UITextField!
    
    private let paymentService = CFPaymentGatewayService.getInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NOTE:- We recommend that callbacks be registered independently and always in ViewDidLoad.
        self.paymentService.setCallback(self)
        self.navigationItem.title = "Wallet"
        
        if Utils.environment == .SANDBOX {
            self.phoneNumberTextField.text = "8908908901"
            self.channelTextField.text = "phonepe"
        }
    }
    
    
    @IBAction func payButtonTapped(_ sender: Any) {
        
        // NOTE:-
        // Order has to be initiated here from your backend service.
        // The order_id and order_token that is generated has to be passed to SDK
        // Then only the below steps has to be executed.
        
        DispatchQueue.main.async {
            do {
                // Create CFSession
                let session = try CFSession.CFSessionBuilder()
                    .setOrderID(Utils.order_id)
                    .setEnvironment(Utils.environment)
                    .setPaymentSessionId(Utils.payment_session_id)
                    .build()
                
                // Create CFWallet
                let wallet = try CFWallet.CFWalletBuilder()
                    .setPhone(self.phoneNumberTextField.text ?? "")
                    .setProvider(self.channelTextField.text ?? "")
                    .build()
                
                // Create Payment
                let payment = try CFWalletPayment.CFWalletPaymentBuilder()
                    .setWallet(wallet)
                    .setSession(session)
                    .build()
                
                // Initiate Payment
                self.paymentService.setCallback(self)
                try self.paymentService.doPayment(payment, viewController: self)
            } catch {
                
            }
        }
    }
    
}

extension WalletViewController: CFResponseDelegate {
    
    func verifyPayment(order_id: String) {
        print(order_id)
    }
    
    func onError(_ error: CFErrorResponse, order_id: String) {
        print(error.message)
    }
    
    
}
