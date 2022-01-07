//
//  ContentView.swift
//  Leave Tracker
//
//  Created by Anmol Jain on 01/09/21.
//

import SwiftUI
import Introspect

struct ContentView: View {
    var body: some View {
		TabView {
			NavigationView {
				LeavesView()
			}
			.tabItem {
				Label("Leaves", systemImage: "list.bullet.circle.fill")
			}
		
			NavigationView {
				TeamView()
			}
			.tabItem {
				Label("Team", systemImage: "person.3.sequence.fill")
			}
		}
		.introspectTabBarController { tabView in
			let bar = UITabBarAppearance()
			bar.backgroundEffect = UIBlurEffect(style: .systemChromeMaterial)
			
			tabView.tabBar.standardAppearance = bar
			tabView.tabBar.scrollEdgeAppearance = bar
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
		}
    }
}
