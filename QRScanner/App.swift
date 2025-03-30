//
//  App.swift
//  QRScanner
//
//  Created by Omar Leal on 3/30/25.
//

import SwiftUI
import Flutter

@main
struct QRScanAppFlutter: App {
    @StateObject private var flutterManager = FlutterManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(flutterManager)
        }
    }
}
