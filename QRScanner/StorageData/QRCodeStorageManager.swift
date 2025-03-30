//
//  QRCodeStorageManager.swift
//  QRScanner
//
//  Created by Omar Leal on 3/30/25.
//

import CoreData
import SwiftUI

class QRCodeStorageManager {
    static let shared = QRCodeStorageManager()
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "QRCodeModel")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Error al cargar CoreData: \(error)")
            }
        }
    }
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveCode(_ code: String) {
        let newCode = ScannedCode(context: context)
        newCode.id = UUID()
        newCode.content = code
        newCode.dateScanned = Date()
        
        do {
            try context.save()
        } catch {
            print("Error guardando código QR: \(error)")
        }
    }
    
    func fetchCodes() -> [ScannedCode] {
        let request: NSFetchRequest<ScannedCode> = ScannedCode.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \ScannedCode.dateScanned, ascending: false)]
        
        do {
            return try context.fetch(request)
        } catch {
            print("Error obteniendo códigos: \(error)")
            return []
        }
    }
}
