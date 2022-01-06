//
//  Screen.swift
//  Leave Tracker
//
//  Created by Anmol Jain on 07/01/22.
//

import SwiftUI

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
