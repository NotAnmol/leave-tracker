//
//  AddTeamMemberView.swift
//  Leave Tracker
//
//  Created by Anmol Jain on 07/01/22.
//

import SwiftUI

struct AddTeamMemberView: View {
	@Environment(\.presentationMode) var presentationMode
	@Environment(\.managedObjectContext) private var viewContext
	
	@State private var teamMemberName: String = ""
	
	var body: some View {
		NavigationView {
			VStack(alignment: .leading, spacing: 10) {
				nameTextField
					.padding(.top, 30)
				Spacer()
				saveButton
			}
			.padding(.horizontal)
			.navigationTitle("Add Team Member")
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					Button(action: { presentationMode.wrappedValue.dismiss() }) {
						Text("Cancel")
					}
				}
			}
		}
	}
	
	private var nameTextField: some View {
		TextField("Enter team member's name", text: $teamMemberName)
			.textInputAutocapitalization(.words)
			.padding()
			.frame(height: 60)
			.foregroundColor(teamMemberName.isEmpty ? .suraasaCarbon : .suraasaAluminium)
			.background(VisualEffectBlur(blurStyle: .systemChromeMaterial))
			.cornerRadius(10)
	}
	
	private var saveButton: some View {
		Button(action: {
			save()
			UINotificationFeedbackGenerator().notificationOccurred(.success)
			presentationMode.wrappedValue.dismiss()
		}) {
			Text("Send")
				.font(.headline)
				.foregroundColor(.suraasaWhite)
				.frame(maxWidth: .infinity, maxHeight: 60)
				.foregroundColor(teamMemberName.isEmpty ? .suraasaCarbon : .suraasaWhite)
				.background(teamMemberName.isEmpty ? Color.suraasaBlack20 : Color.suraasaBlue)
				.cornerRadius(10)
		}
		.padding(.bottom)
		.disabled(teamMemberName.isEmpty)
	}
}

extension AddTeamMemberView {
	private func save() {
		withAnimation {
			let newMember = TeamMember(context: viewContext)
			newMember.dateAdded = Date()
			newMember.name = teamMemberName
			
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

struct AddTeamMemberView_Previews: PreviewProvider {
    static var previews: some View {
        AddTeamMemberView()
    }
}
