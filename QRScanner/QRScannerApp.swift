//
//  QRScannerApp.swift
//  QRScanner
//
//  Created by Omar Leal on 3/30/25.
//

import SwiftUI

@main
struct QRScannerApp: App {
    @StateObject var flutterManager = FlutterManager()
    @State private var isAuthenticated = false
    var body: some Scene {
        WindowGroup {
            if isAuthenticated {
                ContentView()
                    .environmentObject(flutterManager)
                    .preferredColorScheme(.light)
            } else {
                AuthenticationView(isAuthenticated: $isAuthenticated)
                .preferredColorScheme(.light) //
            }
        }
    }
}
