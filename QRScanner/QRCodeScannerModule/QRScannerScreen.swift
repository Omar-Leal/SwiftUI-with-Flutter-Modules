//
//  QRScannerScreen.swift
//  QRScanner
//
//  Created by Omar Leal on 3/30/25.


import SwiftUI

struct QRScannerScreen: View {
    @State private var scannedCode: String? = nil
    @State private var isPresentingScanner = false
    private let storageManager = QRCodeStorageManager.shared
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 20) {
                if let scannedCode = scannedCode {
                    Text("Código Escaneado: \(scannedCode)")
                        .font(.headline)
                        .padding()
                } else {
                    Text("Escanea un código QR")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Button(action: {
                    isPresentingScanner = true
                }) {
                    Text("Escanear QR")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .sheet(isPresented: $isPresentingScanner) {
                QRCodeScannerView(scannedCode: $scannedCode)
            }
            .onChange(of: scannedCode) { newValue in
                if let code = newValue {
                    saveScannedCode(code)
                    isPresentingScanner = false
                }
            }
        }
        
    }
    
    
        // Función para guardar el código
    private func saveScannedCode(_ code: String) {
        storageManager.saveCode(code)
        print("Código guardado: \(code)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QRScannerScreen()
    }
}

