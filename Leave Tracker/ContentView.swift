//
//  ContentView.swift
//  Leave Tracker
//
//  Created by Anmol Jain on 01/09/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
		LeavesView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
		}
    }
}
