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
                .setOrderToken(Utils.order_token) // Replace the order_token
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
    
    func verifyPayment(order_id: String) {
        print(order_id)
    }
    
    func onError(_ error: CFErrorResponse, order_id: String) {
        print(error.message)
    }
}
