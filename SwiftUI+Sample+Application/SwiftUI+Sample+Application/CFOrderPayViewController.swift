//
//  CFOrderPayViewController.swift
//  SwiftUI+Sample+Application
//
//  Created by Suhas G on 20/04/22.
//

import UIKit
import CashfreePG
import CashfreePGCoreSDK
import CashfreePGUISDK

class CFOrderPayViewController: UIViewController, CFResponseDelegate {
    
    private let payment_session_id = "AD100Ylt4WcH2CpkcATH"
    private let order_id = "order_5708728408MBp8YC38R00YVBOB0lhQ0S"
    private let pgService = CFPaymentGatewayService.getInstance()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clear.withAlphaComponent(0)
        
        // Drop Checkout
        self.pgService.setCallback(self)
        do {
            let session = try CFSession.CFSessionBuilder()
                .setOrderID(self.order_id)
                .setPaymentSessionId(self.payment_session_id)
                .setEnvironment(.SANDBOX)
                .build()
            
            let payment = try CFDropCheckoutPayment.CFDropCheckoutPaymentBuilder()
                .setSession(session)
                .build()
            
            try self.pgService.doPayment(payment, viewController: self)
        } catch {
            
        }
    }
    
    // Web Checkout
    private func webCheckout() {
        self.pgService.setCallback(self)
        do {
            let session = try CFSession.CFSessionBuilder()
                .setOrderID(self.order_id)
                .setPaymentSessionId(self.payment_session_id)
                .setEnvironment(.SANDBOX)
                .build()
            
            let payment = try CFWebCheckoutPayment.CFWebCheckoutPaymentBuilder()
                .setSession(session)
                .build()
            
            try self.pgService.doPayment(payment, viewController: self)
        } catch {
            
        }
    }

    func onError(_ error: CFErrorResponse, order_id: String) {
        print(error.message ?? "")
        // Pass message back
    }
    
    func verifyPayment(order_id: String) {
        print(order_id)
        // Pass message back
    }

}
