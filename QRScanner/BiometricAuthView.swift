//
//  BiometricAuthView.swift
//  QRScanner
//
//  Created by Omar Leal on 3/30/25.
//

import SwiftUI

struct BiometricAuthView: View {
    @StateObject private var viewModel = BiometricAuthViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isAuthenticated {
                Text("Bienvenido!")
            } else {
                Button("Autenticarse con Face ID / Touch ID") {
                    viewModel.authenticate()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
    }
}
