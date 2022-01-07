//
//  TeamView.swift
//  Leave Tracker
//
//  Created by Anmol Jain on 07/01/22.
//

import SwiftUI

struct TeamView: View {
	@Environment(\.managedObjectContext) private var viewContext
	
	@FetchRequest(
		sortDescriptors: [NSSortDescriptor(keyPath: \TeamMember.dateAdded, ascending: true)],
		animation: .default)
	private var teamMembers: FetchedResults<TeamMember>
	
	@State private var showAddTeamMemberModal: Bool = false
	
	var body: some View {
		List {
			ForEach(teamMembers) { member in
				HStack {
					let initials = initials(of: member.name!)
					
					if let initials = initials {
						Text(initials)
							.font(.subheadline.bold())
							.frame(width: 35, height: 35)
							.background(Circle().fill(Color.accentColor))
							.foregroundColor(.white)
					} else {
						Image(systemName: "person.fill")
							.font(.subheadline.bold())
							.frame(width: 35, height: 35)
							.background(Circle().fill(Color.accentColor))
							.foregroundColor(.white)
					}
					
					Text(member.name!)
				}
			}
			.onDelete(perform: deleteItems)
		}
		.listStyle(.plain)
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				Button(action: { showAddTeamMemberModal.toggle() }) {
					Label("Add Team Member", systemImage: "plus")
				}
				.sheet(isPresented: $showAddTeamMemberModal) {
					AddTeamMemberView()
				}
			}
			
			ToolbarItem(placement: .navigationBarLeading) {
				EditButton()
			}
		}
		.navigationTitle("Team")
	}
	
	private func deleteItems(offsets: IndexSet) {
		withAnimation {
			offsets.map { teamMembers[$0] }.forEach(viewContext.delete)

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
	
	private func initials(of name: String) -> String? {
		let names = name.components(separatedBy: " ")
		guard !names.isEmpty else { return nil }
		
		let firstName: String = names.first!
		let lastName: String? = names.last
		
		if names.count == 1 {
			return "\(firstName[firstName.startIndex])"
		} else {
			return "\(firstName[firstName.startIndex])\(lastName != nil ? String(lastName![lastName!.startIndex]) : "")"
		}
	}
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
		TeamView()
    }
}
