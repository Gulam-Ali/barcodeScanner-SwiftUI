//
//  ContentView.swift
//  barcodeScanner
//
//  Created by Gulam Ali on 03/07/24.
//

import SwiftUI

struct alertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton : Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = alertItem(title: "Invalid Device Input", message: "You cannot test in simulator", dismissButton: .default(Text("Ok")))
    
    static let invaliDScanFormat = alertItem(title: "Invalid Scan Format", message: "Invalid Scan Format, supports only ean8, ean13", dismissButton: .default(Text("Ok")))
}

struct ContentView: View {
    
    @State private var scannedCode = ""
    @State private var alertItem : alertItem?
    
    var body: some View {
        NavigationView{
            VStack{
               scannerView(scannedCode: $scannedCode, alertItem: $alertItem)
                    .frame(maxWidth: .infinity,maxHeight: 280)
                Spacer().frame(height: 80)
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                Text(scannedCode.isEmpty ? "Not Scanned Yet" : scannedCode)
                    .font(.title)
                    .foregroundColor(scannedCode.isEmpty ? .red : .green)
                    .padding()
            }
            .navigationTitle("BarCode Scanner")
            .alert(item: $alertItem){ alertItemm in
                Alert(title: Text(alertItemm.title),
                      message: Text(alertItemm.message),
                      dismissButton: alertItemm.dismissButton)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
