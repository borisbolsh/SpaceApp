import Foundation

struct SettingsViewModel {
	let itemType: SettingsItemType
	let titleItem: String
	let firstStat: String
	let secondStat: String
	let activeItem: String
}

enum SettingsItemType {
	case height
	case diameter
	case mass
	case payloadWeights
}
