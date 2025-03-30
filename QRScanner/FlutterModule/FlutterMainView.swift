//
//  FlutterMainView.swift
//  QRScanner
//
//  Created by Omar Leal on 3/30/25.
//

import SwiftUI
import Flutter

struct FlutterView: UIViewControllerRepresentable {
    @EnvironmentObject var flutterManager: FlutterManager
    
    func makeUIViewController(context: Context) -> FlutterViewController {
        let flutterVC = FlutterViewController(engine: flutterManager.flutterEngine, nibName: nil, bundle: nil)
        return flutterVC
    }
    
    func updateUIViewController(_ uiViewController: FlutterViewController, context: Context) {}
}
