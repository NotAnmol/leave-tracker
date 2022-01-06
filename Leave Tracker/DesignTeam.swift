//
//  DesignTeam.swift
//  DesignTeam
//
//  Created by Anmol Jain on 01/09/21.
//

import SwiftUI

enum DesignTeam: Int16, Codable, CaseIterable {
	case anmol
	case dikshant
	case manjot
	case raksha
	case sandeep
	case ankita
	case vivek
}

extension DesignTeam {
	var name: String {
		switch self {
		case .anmol: return "Anmol Jain"
		case .dikshant: return "Dikshant Rawat"
		case .manjot: return "Manjot Singh Gulati"
		case .raksha: return "Raksha Kanodia"
		case .sandeep: return "Sandeep Kumar Singh"
		case .ankita: return "Ankita Mehra"
		case .vivek: return "Vivek Ranjan"
		}
	}
}


enum Month: Int, Codable, CaseIterable {
	case january = 1
	case february = 2
	case march = 3
	case april = 4
	case may = 5
	case june = 6
	case july = 7
	case august = 8
	case september = 9
	case october = 10
	case november = 11 
	case december = 12
}

extension Month {
	var title: String {
		switch self {
		case .january: return "January"
		case .february: return "February"
		case .march: return "March"
		case .april: return "April"
		case .may: return "May"
		case .june: return "June"
		case .july: return "July"
		case .august: return "August"
		case .september: return "September"
		case .october: return "October"
		case .november: return "November"
		case .december: return "December"
		}
	}
}


/// Different Screen Sizes
enum Screen {
	/// Whole width of the screen
	static let width = UIScreen.main.bounds.width
	
	/// Whole height of the screen
	static let height = UIScreen.main.bounds.height
	
	/// Case less enum for Screen Width
	enum Width {
		/// Screen width percentage
		static let fivePercent = Screen.width * 0.05
		static let tenPercent = Screen.width * 0.1
		static let twentyPercent = Screen.width * 0.2
		static let thirtyPercent = Screen.width * 0.3
		static let fortyPercent = Screen.width * 0.4
		static let fiftyPercent = Screen.width * 0.5
		static let sixtyPercent = Screen.width * 0.6
		static let seventyPercent = Screen.width * 0.7
		static let eightyPercent = Screen.width * 0.8
		static let nintyPercent = Screen.width * 0.9
		
		/// 2/3 of the screen width
		static let twoThird = Screen.width * 2 / 3
	}
	
	enum Height {
		/// Screen height percentage
		static let tenPercent = Screen.height * 0.1
		static let twentyPercent = Screen.height * 0.2
		static let thirtyPercent = Screen.height * 0.3
		static let fortyPercent = Screen.height * 0.4
		static let fiftyPercent = Screen.height * 0.5
		static let sixtyPercent = Screen.height * 0.6
		static let seventyPercent = Screen.height * 0.7
		static let eightyPercent = Screen.height * 0.8
		static let nintyPercent = Screen.height * 0.9
		
		/// 2/3 of the screen height
		static let twoThird = Screen.height * 2 / 3
	}
	
	/// Returns a Boolean value indicating whether if the device have a FaceID Module (devices with
	/// no physical home button).
	///
	/// Comparing the screen ratio to 16:9 upto 3 decimal places.
	static let isXorAbove = String(format: "%.3f", Screen.width / Screen.height) != String(format: "%.3f", 9.0 / 16.0)
}
