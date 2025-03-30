//
//  ContentView.swift
//  QRScanner
//
//  Created by Omar Leal on 3/30/25.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            QRCodeScannerView(viewModel: QRCodeScannerViewModel())
                .tabItem {
                    Label("Escanear", systemImage: "qrcode.viewfinder")
                }
            
            FlutterCustomView()
                . tabItem {
                    Label("Flutter View", systemImage: "bird.fill")
                }
            
            ScannedCodesListView()
                .tabItem {
                    Label("Historial", systemImage: "clock")
                }
        }
    }
}


#Preview {
    ContentView()
}
