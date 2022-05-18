import Foundation
import SwiftUI

struct CFOrderPayController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        return CFOrderPayViewController(nibName: "CFOrderPayViewController", bundle: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}
