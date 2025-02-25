//
//  nikeApp.swift
//  nike
//
//  Created by .Leeerrrmmm . on 24.02.2025.
//

import SwiftUI

@main
struct nikeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
