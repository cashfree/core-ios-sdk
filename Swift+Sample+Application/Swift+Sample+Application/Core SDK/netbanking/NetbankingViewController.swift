//
//  NetbankingViewController.swift
//  Swift+Sample+Application
//
//  Created by Suhas G on 25/01/22.
//

import UIKit
import CashfreePG
import CashfreePGCoreSDK

class NetbankingViewController: UIViewController {
    
    @IBOutlet var bankCodeTextField: UITextField!
    // Visit cashfree.com for all bank codes
    
    private let paymentService = CFPaymentGatewayService.getInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Netbanking Payment"
        
        // NOTE:- We recommend that callbacks be registered independently and always in ViewDidLoad.
        self.paymentService.setCallback(self)
        
        if Utils.environment == .SANDBOX {
            self.bankCodeTextField.text = "3003"
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
                
                // Create CFNetbanking
                let netBanking = try CFNetbanking.CFNetbankingBuilder()
                    .setBankCode(Int(self.bankCodeTextField.text ?? "3003") ?? 3003)
                    .build()
                
                // Create Payment
                let payment = try CFNetbankingPayment.CFNetbankingPaymentBuilder()
                    .setNetbanking(netBanking)
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

extension NetbankingViewController: CFResponseDelegate {
    
    func verifyPayment(order_id: String) {
        print(order_id)
    }
    
    func onError(_ error: CFErrorResponse, order_id: String) {
        print(error.message)
    }
    
    
}
