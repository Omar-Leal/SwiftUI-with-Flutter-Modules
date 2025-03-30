//
//  FlutterManager.swift
//  QRScanner
//
//  Created by Omar Leal on 3/30/25.
//

import Flutter

class FlutterManager: ObservableObject {
    let flutterEngine = FlutterEngine(name: "flutter_engine")
    
    init() {
        flutterEngine.run()
    }
}
