//
//  StartPageViewController.swift
//  Swift+Sample+Application
//
//  Created by Suhas G on 25/01/22.
//

import UIKit
import CashfreePG
import CashfreePGCoreSDK
import CashfreePGUISDK

class StartPageViewController: UIViewController, CFResponseDelegate {
   
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func coreSDKTapped(_ sender: Any) {
        let viewController = CoreSDKViewController(nibName: "CoreSDKViewController", bundle: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func nativeCheckoutSDKTapped(_ sender: Any) {
        do {
            let session = try CFSession.CFSessionBuilder()
                .setOrderID(Utils.order_id) // Replace the order_id
                .setPaymentSessionId(Utils.payment_session_id) // Replace the order_token
                .setEnvironment(Utils.environment)
                .build()
            let paymentComponent = try CFPaymentComponent.CFPaymentComponentBuilder()
                .enableComponents([
                    "order-details",
                    "card",
                    "upi",
                    "wallet",
                    "netbanking",
                    "emi",
                    "paylater"
                ])
                .build()
            let nativeCheckoutPayment = try CFDropCheckoutPayment.CFDropCheckoutPaymentBuilder()
                .setSession(session)
                .setComponent(paymentComponent)
                .build()
            
            let service = CFPaymentGatewayService.getInstance()
            service.setCallback(self)
            try service.doPayment(nativeCheckoutPayment, viewController: self)
        } catch let e {
            let error = e as! CashfreeError
            print(error.localizedDescription)
        }
    }
    
    @IBAction func webCheckoutTapped(_ sender: Any) {
        do {
            let session = try CFSession.CFSessionBuilder()
                .setPaymentSessionId(Utils.payment_session_id)
                .setOrderID(Utils.order_id)
                .setEnvironment(Utils.environment)
                .build()
            let webCheckoutPayment = try CFWebCheckoutPayment.CFWebCheckoutPaymentBuilder()
                .setSession(session)
                .build()
            let cfPaymentGateway = CFPaymentGatewayService.getInstance()
            cfPaymentGateway.setCallback(self)
            try cfPaymentGateway.doPayment(webCheckoutPayment, viewController: self)
        } catch let e {
            let err = e as! CashfreeError
            print(err.description)
        }
    }
    
    
    func verifyPayment(order_id: String) {
        print(order_id)
    }
    
    func onError(_ error: CFErrorResponse, order_id: String) {
        print(error.message)
    }
}
