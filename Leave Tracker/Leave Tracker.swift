//
//  Leave_TrackerApp.swift
//  Leave Tracker
//
//  Created by Anmol Jain on 01/09/21.
//

import SwiftUI

@main
struct Leave_TrackerApp: App {
    let persistenceController = PersistenceController.shared
	@Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
			NavigationView {
				ContentView()
					.environment(\.managedObjectContext, persistenceController.container.viewContext)
			}
        }
		.onChange(of: scenePhase) { _ in
			persistenceController.save()
		}
    }
}
