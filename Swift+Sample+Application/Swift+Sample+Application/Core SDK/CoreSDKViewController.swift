//
//  CoreSDKViewController.swift
//  Swift+Sample+Application
//
//  Created by Suhas G on 25/01/22.
//

import UIKit
import CashfreePG

class CoreSDKViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Payment Options"
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

}

extension CoreSDKViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "options")
        cell.selectionStyle = .none
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "CARD"
            break
        case 1:
            cell.textLabel?.text = "UPI"
            break
        case 2:
            cell.textLabel?.text = "WALLET"
            break
        case 3:
            cell.textLabel?.text = "NETBANKING"
            break
        case 4:
            cell.textLabel?.text = "PAYLATER"
            break
        default:
            break
        }
        if #available(iOS 13.0, *) {
            let downArrow = UIImage(systemName: "chevron.right")
            cell.accessoryView = UIImageView(image: downArrow)
        } else {
            // Fallback on earlier versions
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let cardViewController = CardViewController(nibName: "CardViewController", bundle: nil)
            self.navigationController?.pushViewController(cardViewController, animated: true)
            break
        case 1:
            let upiViewController = UPIViewController(nibName: "UPIViewController", bundle: nil)
            self.navigationController?.pushViewController(upiViewController, animated: true)
            break
        case 2:
            let walletViewController = WalletViewController(nibName: "WalletViewController", bundle: nil)
            self.navigationController?.pushViewController(walletViewController, animated: true)
            break
        case 3:
            let netbankingViewController = NetbankingViewController(nibName: "NetbankingViewController", bundle: nil)
            self.navigationController?.pushViewController(netbankingViewController, animated: true)
            break
        default:
            break
        }
    }
    
    
}
