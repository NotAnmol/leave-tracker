//
//  MonthPickerView.swift
//  Leave Tracker
//
//  Created by Anmol Jain on 06/01/22.
//

import SwiftUI

struct MonthPickerView: View {
	@Binding var month: Int
	@Binding var year: Int
	
	var body: some View {
		HStack {
			MPButton(icon: "arrow.left") {
				if month == 1 {
					month = 12
					year -= 1
				} else {
					month -= 1
				}
			}
			
			Spacer()
			Text("\((Month(rawValue: month) ?? .january).title), \(String(year))")
				.font(.headline)
			Spacer()
			
			MPButton(icon: "arrow.right") {
				if month == 12 {
					month = 1
					year += 1
				} else {
					month += 1
				}
			}
		}
		.padding()
	}
	
	struct MPButton: View {
		let icon: String
		let action: () -> ()
		
		var body: some View {
			Button(action: action) {
				Image(systemName: icon)
					.frame(width: 40, height: 40, alignment: .center)
					.background(VisualEffectBlur(blurStyle: .systemThinMaterial))
					.cornerRadius(8)
			}
		}
	}
}


struct MonthPickerView_Previews: PreviewProvider {
	@State static var month: Int = 1
	@State static var year: Int = 2020
	
    static var previews: some View {
		MonthPickerView(month: $month, year: $year)
    }
}
