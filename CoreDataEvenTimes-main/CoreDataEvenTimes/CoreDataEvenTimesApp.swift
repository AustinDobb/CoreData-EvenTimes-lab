//
//  CoreDataEvenTimesApp.swift
//  CoreDataEvenTimes
//
//  Created by Parker Rushton on 10/3/22.
//

import SwiftUI

@main
struct CoreDataEvenTimesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
