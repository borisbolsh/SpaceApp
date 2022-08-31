import Foundation

struct UserSettings: Codable {
	var height: UnitOfLength
	var diameter: UnitOfLength
	var mass: UnitsOfMass
	var payloadWeights: UnitsOfMass
}

enum UnitOfLength: String, Codable {
	case meters = "m"
	case feet = "ft"
}

enum UnitsOfMass: String, Codable {
	case kilograms = "kg"
	case pound = "lb"
}
