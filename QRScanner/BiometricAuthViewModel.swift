//
//  BiometricAuthViewModel.swift
//  QRScanner
//
//  Created by Omar Leal on 3/30/25.
//

import LocalAuthentication
import SwiftUI

class BiometricAuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Autenticarse para acceder a la aplicación."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    self.isAuthenticated = success
                }
            }
        } else {
            print("Autenticación biométrica no disponible.")
        }
    }
}
