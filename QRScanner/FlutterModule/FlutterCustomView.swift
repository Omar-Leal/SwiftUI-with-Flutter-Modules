//
//  FlutterCustomView.swift
//  QRScanner
//
//  Created by Omar Leal on 3/30/25.
//

import SwiftUI

struct FlutterCustomView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Bienvenido a QR Scan")
                    .font(.largeTitle)
                
                NavigationLink("Ir a Flutter", destination: FlutterView())
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}
