//
//  LeavesView.swift
//  Leave Tracker
//
//  Created by Anmol Jain on 07/01/22.
//

import SwiftUI

struct LeavesView: View {
	@Environment(\.managedObjectContext) private var viewContext
	@State private var month: Int = Calendar.current.component(.month, from: Date())
	@State private var year: Int = Calendar.current.component(.year, from: Date())

	var body: some View {
		VStack(spacing: 0) {
			ZStack(alignment: .bottomTrailing) {
				LeavesListView(filter: month, and: year)
				addButton
					.padding([.bottom, .trailing])
			}
			
			Divider()
			monthPicker
		}
		.navigationTitle("Leaves")
	}
	
	private var addButton: some View {
		NavigationLink(destination: AddLeaveView(currentMonth: (month, year)).environment(\.managedObjectContext, viewContext)) {
			Image(systemName: "plus")
				.font(.title3.bold())
				.frame(width: 55, height: 55)
				.background(Circle().fill(Color.accentColor))
				.foregroundColor(.white)
		}
	}
	
	private var monthPicker: some View {
		MonthPickerView(month: $month, year: $year)
			.background(VisualEffectBlur(blurStyle: .systemChromeMaterial))
	}
}

struct LeavesView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
		}
	}
}
