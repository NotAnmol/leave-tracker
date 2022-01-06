//
//  PerfectMonthView.swift
//  Leave Tracker
//
//  Created by Anmol Jain on 06/01/22.
//

import SwiftUI

struct PerfectMonthView: View {
	@Environment(\.colorScheme) var colorScheme
	private let filename = Calendar.current.component(.day, from: Date()) % 15 + 1
    var body: some View {
		VStack {
			Group {
				if colorScheme == .dark {
					Image("\(filename)")
						.resizable()
						.colorInvert()
				} else {
					Image("\(filename)")
						.resizable()
				}
			}
			.scaledToFit()
			.padding()
			
			Text("Your team is awesome and working their ass off.")
				.font(.title3.bold())
				.multilineTextAlignment(.center)
				.frame(width: 250)
		}
    }
}

struct PerfectMonthView_Previews: PreviewProvider {
    static var previews: some View {
        PerfectMonthView()
    }
}
