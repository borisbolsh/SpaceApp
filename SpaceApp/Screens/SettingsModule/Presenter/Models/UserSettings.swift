import Foundation

struct UserSettings {
	let height: UnitOfLength
	let diameter: UnitOfLength
	let mass: UnitsOfMass
	let payloadWeights: UnitsOfMass
}

enum UnitOfLength: String {
	case meters = "m"
	case feet = "ft"
}

enum UnitsOfMass: String {
	case kilograms = "kg"
	case pound = "lb"
}
