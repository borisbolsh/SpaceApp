import Foundation

struct UserSettings: Codable {
	let height: UnitOfLength
	let diameter: UnitOfLength
	let mass: UnitsOfMass
	let payloadWeights: UnitsOfMass
//	var dictionary: [String: Any] {
//				return ["height": height,
//								"diameter": diameter,
//								"mass": mass,
//								"payloadWeights": payloadWeights]
//		}
}

enum UnitOfLength: String, Codable {
	case meters = "m"
	case feet = "ft"
}

enum UnitsOfMass: String, Codable {
	case kilograms = "kg"
	case pound = "lb"
}
