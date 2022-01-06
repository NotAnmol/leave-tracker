//
//  DesignTeam.swift
//  DesignTeam
//
//  Created by Anmol Jain on 01/09/21.
//

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
