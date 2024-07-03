//
//  scannerView.swift
//  barcodeScanner
//
//  Created by Gulam Ali on 03/07/24.
//

import SwiftUI

struct scannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode : String
    @Binding var alertItem : alertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate{
        
        private let scannerView : scannerView
        init(scannerView: scannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            print(barcode)
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            print(error)
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannerView.alertItem = AlertContext.invaliDScanFormat
            }
        }
        
        
    }
    
}


