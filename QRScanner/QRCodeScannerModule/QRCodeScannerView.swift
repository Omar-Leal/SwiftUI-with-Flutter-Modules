//
//  QRCodeScannerView.swift.swift
//  QRScanner
//
//  Created by Omar Leal on 3/30/25.
//

import SwiftUI
import AVFoundation

struct QRCodeScannerView: UIViewControllerRepresentable {
    @ObservedObject var viewModel: QRCodeScannerViewModel
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        
        // evitando error en optional captureSession con guard
        guard let captureSession = viewModel.captureSession else {
            return controller
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = controller.view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        controller.view.layer.addSublayer(previewLayer)
        
            // Iniciar la sesión en un hilo en segundo plano
        DispatchQueue.global(qos: .userInitiated).async {
            if !captureSession.isRunning {
                captureSession.startRunning()
            }
        }
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            // Actualizar el frame del preview layer si el tamaño cambia
        if let layer = uiViewController.view.layer.sublayers?.first as? AVCaptureVideoPreviewLayer {
            layer.frame = uiViewController.view.layer.bounds
        }
    }
    
    static func dismantleUIViewController(_ uiViewController: UIViewController, coordinator: ()) {
            // Detener la sesión cuando la vista se desmonta
        if let layer = uiViewController.view.layer.sublayers?.first as? AVCaptureVideoPreviewLayer,
           let session = layer.session {
            DispatchQueue.global(qos: .userInitiated).async {
                if session.isRunning {
                    session.stopRunning()
                }
            }
        }
    }
}
