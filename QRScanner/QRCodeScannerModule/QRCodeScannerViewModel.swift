//
//  QRCodeScannerViewModel.swift.swift
//  QRScanner
//
//  Created by Omar Leal on 3/30/25.
//

import AVFoundation
import SwiftUI

class QRCodeScannerViewModel: NSObject, ObservableObject, AVCaptureMetadataOutputObjectsDelegate {
    @Published var scannedCode: String?
     var captureSession: AVCaptureSession?
    
    func startScanning() {
        let session = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back),
              let videoInput = try? AVCaptureDeviceInput(device: videoCaptureDevice) else {
            return
        }
        
        session.addInput(videoInput)
        
        let metadataOutput = AVCaptureMetadataOutput()
        session.addOutput(metadataOutput)
        
        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        metadataOutput.metadataObjectTypes = [.qr]
        
        self.captureSession = session
        session.startRunning()
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
           let stringValue = metadataObject.stringValue {
            DispatchQueue.main.async {
                self.scannedCode = stringValue
                QRCodeStorageManager.shared.saveCode(stringValue)
                self.captureSession?.stopRunning()
            }
        }
    }

}
