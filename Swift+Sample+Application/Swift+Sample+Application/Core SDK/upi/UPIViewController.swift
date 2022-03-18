//
//  UPIViewController.swift
//  Swift+Sample+Application
//
//  Created by Suhas G on 25/01/22.
//

import UIKit
import CashfreePGCoreSDK

class UPIViewController: UIViewController {
    
    @IBOutlet var upiIDTextField: UITextField!
    private let paymentService = CFPaymentGatewayService.getInstance()
    private var isSandboxAndIntent = false
    
    private var applications = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "UPI Payment"
        
        // NOTE:- We recommend that callbacks be registered independently and always in ViewDidLoad.
        
        self.paymentService.setCallback([self])
        
        if Utils.environment == .SANDBOX {
            self.upiIDTextField.text = "testsuccess@gocash"
        }
    }
    
    @IBAction func payButtonTapped(_ sender: Any) {
        self.isSandboxAndIntent = false
        self.makePayment(mode: .COLLECT, upi_id: self.upiIDTextField.text ?? "")
    }
    
    private func makePayment(mode: CFUPIMODE, upi_id: String) {
        
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
                    .setOrderToken(Utils.order_token)
                    .build()
                
                // Create CFUPI -> Collect
                let upi = try CFUPI.CFUPIBuilder()
                    .setChannel(mode)
                    .setUpiId(upi_id)
                    .build()
                
                // Create Payment
                let payment = try CFUPIPayment.CFUPIPaymentBuilder()
                    .setUPI(upi)
                    .setSession(session)
                    .build()
                
                // Initiate Payment
                try self.paymentService.doPayment(payment: payment)
            } catch {
                
            }
        }
    }
    
    // In case of UPI Intent, you have to first call the below function to get a list of all the installed UPI Applications. Currently we support GPay, PhonePe, Paytm and BHIM
    private func getInstalledApplications() {
        self.applications = CFUPIUtils().getInstalledUPIApplications()
        
        // Using this applications list, the UI has to be built. For Demo purpose we have added all applications here
    }
    
    // The Order in which the applications are retrieved may vary depending on the applications installed. PLEASE USE RESPECTIVE INDEX value on Tap
    @IBAction func gpayTapped(_ sender: Any) {
        if Utils.environment == .SANDBOX {
            self.isSandboxAndIntent = true
        }
        self.makePayment(mode: .INTENT, upi_id: "tez://")//self.applications[0]["id"] ?? "")
    }
    
    @IBAction func phonePeTapped(_ sender: Any) {
        if Utils.environment == .SANDBOX {
            self.isSandboxAndIntent = true
        }
        self.makePayment(mode: .INTENT, upi_id: self.applications[2]["id"] ?? "")
    }
    
    @IBAction func paytmTapped(_ sender: Any) {
        if Utils.environment == .SANDBOX {
            self.isSandboxAndIntent = true
        }
        self.makePayment(mode: .INTENT, upi_id: self.applications[1]["id"] ?? "")
    }
    
    @IBAction func bhimTapped(_ sender: Any) {
        if Utils.environment == .SANDBOX {
            self.isSandboxAndIntent = true
        }
        self.makePayment(mode: .INTENT, upi_id: self.applications[3]["id"] ?? "")
    }
}

extension UPIViewController: CFUPIPaymentDelegate {
    func initiatingUPIPayment() {
        // Show Loader here
    }
    
    func verifyUPIPaymentCompletion(for orderId: String) {
        // Verify Payment here
        // Dismiss web-view in case of SANDBOX INTENT
        if self.isSandboxAndIntent {
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func upiPayment(didFinishExecutingWith error: CFErrorResponse) {
        // Handle errors here
    }
    
    func presentWebForAuthenticatingUPIPaymentInSandBoxEnvironment() {
        // Present web for authentication here
        DispatchQueue.main.async {
            let webView = WebViewController(nibName: "WebViewController", bundle: nil)
            webView.modalPresentationStyle = .fullScreen
            self.present(webView, animated: true, completion: nil)
        }
    }
}
