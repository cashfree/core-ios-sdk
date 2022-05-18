//
//  ContentView.swift
//  SwiftUI+Sample+Application
//
//  Created by Suhas G on 20/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var present = false
    
    var body: some View {
        Button {
            self.present = true
        } label: {
            Text("Proceed to Pay")
                .padding(10)
        }.sheet(isPresented: $present) {
            CFOrderPayController()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
