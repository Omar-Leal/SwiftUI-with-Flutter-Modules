//
//  ScannedCodesListView.swift
//  QRScanner
//
//  Created by Omar Leal on 3/30/25.


import SwiftUI

struct ScannedCodesListView: View {
    @State private var codes: [ScannedCode] = []
    
    // mostrar historial de datos escaneados
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            NavigationView {
                List(codes, id: \.id) { code in
                    VStack(alignment: .leading) {
                        Text(code.content ?? "Código desconocido")
                            .font(.headline)
                        Text("\(code.dateScanned ?? Date(), formatter: dateFormatter)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .navigationTitle("Códigos Escaneados")
                .onAppear {
                    self.codes = QRCodeStorageManager.shared.fetchCodes()
                }
            }
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()
