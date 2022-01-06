//
//  AddLeaveView.swift
//  AddLeaveView
//
//  Created by Anmol Jain on 01/09/21.
//

import SwiftUI

struct AddLeaveView: View {
	@Environment(\.managedObjectContext) private var viewContext
	@Environment(\.presentationMode) private var presentationMode
	
	@State private var leaveDate: Date = Date()
	@State private var member: DesignTeam = .anmol
	
	private let currentMonthDate: Date
	
	init(currentMonth: (month: Int, year: Int)) {
		var components = DateComponents()
		components.month = currentMonth.month
		components.year = currentMonth.year

		currentMonthDate = Calendar.current.date(from: components)!
	}
	
    var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			Text("Going for Vacation?")
				.font(.largeTitle.bold())
			Text("Mark your leaves, so that everyone knows your availability")
				.font(.subheadline)
				.foregroundColor(.secondary)
				.padding(.bottom, 30)
			
			Picker("Member", selection: $member) {
				ForEach(DesignTeam.allCases, id: \.self) { member in
					Text(member.name)
						.tag(member)
				}
			}
			.frame(maxWidth: .infinity)
			.padding()
			.background(Color.suraasaAluminium)
			.cornerRadius(10)
			
			DatePicker(
				"Leave Date",
				selection: $leaveDate,
				displayedComponents: .date
			)
			
			Spacer()
			createLeaveButton
		}
		.padding(.horizontal)
		.navigationBarTitleDisplayMode(.inline)
		.onAppear {
			leaveDate = currentMonthDate
		}
    }
	
	private var createLeaveButton: some View {
		Button(action: {
			save(member: member, date: leaveDate)
			presentationMode.wrappedValue.dismiss()
		}) {
			Text("Create Leave")
				.font(.headline)
				.foregroundColor(.suraasaWhite)
				.frame(maxWidth: .infinity, maxHeight: 60)
				.background(Color.suraasaBlue)
				.cornerRadius(10)
		}
		.padding(.bottom)
	}
}

extension AddLeaveView {
	private func save(member: DesignTeam, date: Date) {
		withAnimation {
			let newLeave = LeaveLog(context: viewContext)
			newLeave.timestamp = Date()
			newLeave.member = member.rawValue
			newLeave.leaveDate = date
			
			do {
				try viewContext.save()
			} catch {
				// Replace this implementation with code to handle the error appropriately.
				// fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
				let nsError = error as NSError
				fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
			}
		}
	}
}

struct AddLeaveView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			AddLeaveView(currentMonth: (5, 2022))
		}
    }
}






//struct SelectTeamMember: View {
//	@Environment(\.presentationMode) var presentationMode
//	@EnvironmentObject var phoneNumber: PhoneNumberObserver
//
//	var body: some View {
//		NavigationView {
//			List(phoneNumber.searchResults, rowContent: listItem)
//				.listStyle(.plain)
//				.navigationBarTitle("Country Code", displayMode: .inline)
//				.toolbar {
//					ToolbarItem(placement: .cancellationAction) {
//						cancelButton
//					}
//				}
//				.searchable(text: $phoneNumber.searchText)
//		}
//	}
//
//	private func listItem(_ country: Country) -> some View {
//		Button(action: {
//			phoneNumber.code = country
//			presentationMode.wrappedValue.dismiss()
//		}) {
//			HStack {
//				Text(country.flag).font(.title2)
//				Text(country.name).font(.callout)
//				Spacer()
//				Text("+\(country.code)")
//					.font(.headline)
//					.foregroundColor(.blue)
//			}
//		}
//	}
//
//	private var cancelButton: some View {
//		Button(action: { presentationMode.wrappedValue.dismiss() }) {
//			Text("Cancel")
//		}
//	}
//}
