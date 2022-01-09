//
//  LeavesListView.swift
//  Leave Tracker
//
//  Created by Anmol Jain on 06/01/22.
//

import SwiftUI

struct LeavesListView: View {
	@Environment(\.managedObjectContext) private var viewContext
	@FetchRequest private var leaves: FetchedResults<LeaveLog>
	@FetchRequest(
		sortDescriptors: [NSSortDescriptor(keyPath: \TeamMember.dateAdded, ascending: true)],
		animation: .default)
	private var teamMembers: FetchedResults<TeamMember>
	
	init(filter month: Int, and year: Int) {
		var components = DateComponents()
		components.month = month
		components.year = year
		
		let startDate = NSDate(timeIntervalSinceNow: Calendar.current.date(from: components)!.timeIntervalSinceNow)
		components.month = month + 1
		let endDate = NSDate(timeIntervalSinceNow: Calendar.current.date(from: components)!.timeIntervalSinceNow)
		
		_leaves = FetchRequest<LeaveLog>(
			sortDescriptors: [NSSortDescriptor(keyPath: \LeaveLog.timestamp, ascending: true)],
			predicate: NSPredicate(format: "(leaveDate >= %@) AND (leaveDate < %@)", startDate, endDate),
			animation: .default
		)
	}
	
	@ViewBuilder
	var body: some View {
		if leaves.count == 0 {
			VStack {
				Spacer()
				PerfectMonthView()
				Spacer()
			}
		} else {
			List {
				ForEach(leaves) { leave in
					HStack {
						Text(leave.member!.name ?? "Unknown")
							.font(.headline)
						Spacer()
						Text("\(leave.leaveDate!, formatter: dateFormatter)")
							.font(.subheadline)
							.foregroundColor(.secondary)
					}
				}
				.onDelete(perform: deleteItems)
			}
			.listStyle(.plain)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(action: presentShareSheet) {
					   Image(systemName: "square.and.arrow.up")
				   }
				}
				
				ToolbarItem(placement: .navigationBarLeading) {
					EditButton()
				}
			}
		}
	}
	
	private func deleteItems(offsets: IndexSet) {
		withAnimation {
			offsets.map { leaves[$0] }.forEach(viewContext.delete)

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
	
	private let dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateStyle = .full
		return formatter
	}()
	
	func presentShareSheet() {
		var leavesData: [TeamMember: [Date]] = [:]
		for member in teamMembers {
			leavesData[member] = []
		}
		
		for leave in leaves {
			leavesData[leave.member!]?.append(leave.leaveDate!)
		}
		
		var sharedData: String = ""
		
		for (member, leaveLog) in leavesData {
			if leaveLog.isEmpty { continue }
			sharedData.append("*\(member.name!)*\n")
			leaveLog.forEach { leaveDate in
				sharedData.append(dateFormatter.string(from: leaveDate))
				sharedData.append("\n")
			}
			
			sharedData.append("\n")
		}
		
		let activityVC = UIActivityViewController(activityItems: [sharedData], applicationActivities: nil)
		UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
	}
}
