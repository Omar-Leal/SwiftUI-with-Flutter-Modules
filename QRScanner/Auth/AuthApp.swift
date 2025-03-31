//
//  AuthApp.swift
//  QRScanner
//
//  Created by Omar Leal on 3/30/25.
//

import SwiftUI
import LocalAuthentication

struct AuthenticationView: View {
    @Binding var isAuthenticated: Bool
    @State private var showPinPrompt = false
    @State private var enteredPin = ""
    
    let correctPin = "1234" // 🎯 PIN de respaldo
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            VStack {
                Text("Autenticación requerida")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
                Button(action: authenticate) {
                    Text("Iniciar sesión con biometría")
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                .padding()
            }
        }
        .alert("Ingrese PIN", isPresented: $showPinPrompt) {
            SecureField("PIN", text: $enteredPin)
            Button("Aceptar") {
                if enteredPin == correctPin {
                    isAuthenticated = true // ✅ Desbloquea la app
                }
            }
            Button("Cancelar", role: .cancel) {}
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Autenticación requerida para acceder a la aplicación."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, _ in
                DispatchQueue.main.async {
                    if success {
                        isAuthenticated = true // ✅ Si la autenticación biométrica es exitosa, desbloquea la app
                    } else {
                        showPinPrompt = true // 🛑 Si falla, solicita el PIN
                    }
                }
            }
        } else {
            showPinPrompt = true // 🛑 Si el dispositivo no admite biometría, pide el PIN
        }
    }
}
