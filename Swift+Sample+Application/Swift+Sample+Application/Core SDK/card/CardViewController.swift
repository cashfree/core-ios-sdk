//
//  CardViewController.swift
//  Swift+Sample+Application
//
//  Created by Suhas G on 25/01/22.
//

import UIKit
import CashfreePG
import CashfreePGCoreSDK

class CardViewController: UIViewController {
    @IBOutlet var cardNumberTextField: UITextField!
    @IBOutlet var cardCVVTextField: UITextField!
    @IBOutlet var cardExpiryYearTextField: UITextField!
    @IBOutlet var cardExpiryMonthTextField: UITextField!
    @IBOutlet var cardHolderNameTextField: UITextField!
    
    private let paymentService = CFPaymentGatewayService.getInstance()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Card Payment"
        
        // NOTE:- We recommend that callbacks be registered independently and always in ViewDidLoad.
        self.paymentService.setCallback(self)
        
        if Utils.environment == .SANDBOX {
            self.cardNumberTextField.text = "4111111111111111"
            self.cardHolderNameTextField.text = "Test"
            self.cardExpiryMonthTextField.text = "12"
            self.cardExpiryYearTextField.text = "29"
            self.cardCVVTextField.text = "123"
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
                
                // Create CFCard
                let card = try CFCard.CFCardBuilder()
                    .setCardNumber(self.cardNumberTextField.text ?? "")
                    .setCardExpiryMonth(self.cardExpiryMonthTextField.text ?? "")
                    .setCardExpiryYear(self.cardExpiryYearTextField.text ?? "")
                    .setCardHolderName(self.cardHolderNameTextField.text ?? "")
                    .setCVV(self.cardCVVTextField.text ?? "")
                    .build()
                
                // Create CFCardPayment
                let payment = try CFCardPayment.CFCardPaymentBuilder()
                    .setCard(card)
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

extension CardViewController: CFResponseDelegate {
    
    func verifyPayment(order_id: String) {
        print(order_id)
    }
    
    func onError(_ error: CFErrorResponse, order_id: String) {
        print(error.message)
    }
    
    
}
