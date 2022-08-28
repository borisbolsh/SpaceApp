import Foundation

protocol UserSettingsFactoryProtocol {
	func createFirstSettings() -> UserSettings
	func createSettingsViewModels(userSettings: UserSettings) -> [SettingsViewModel]
}

final class UserSettingsFactory: UserSettingsFactoryProtocol {
	func createFirstSettings() -> UserSettings {
		let newUserSettings = UserSettings(height: .feet,
																			 diameter: .feet,
																			 mass: .pound,
																			 payloadWeights: .pound)
		return newUserSettings
	}

	func createSettingsViewModels(userSettings: UserSettings) -> [SettingsViewModel] {
		let settingsViewModel = [
			SettingsViewModel(
				itemType: .height,
				titleItem: Resourses.Features.heightString,
				firstStat: UnitOfLength.meters.rawValue,
				secondStat: UnitOfLength.feet.rawValue,
				activeItem: userSettings.height.rawValue),
			SettingsViewModel(
				itemType: .diameter,
				titleItem: Resourses.Features.diameterString,
				firstStat: UnitOfLength.meters.rawValue,
				secondStat: UnitOfLength.feet.rawValue,
				activeItem: userSettings.diameter.rawValue),
			SettingsViewModel(
				itemType: .mass,
				titleItem: Resourses.Features.massString,
				firstStat: UnitsOfMass.kilograms.rawValue,
				secondStat: UnitsOfMass.pound.rawValue,
				activeItem: userSettings.mass.rawValue),
			SettingsViewModel(
				itemType: .payloadWeights,
				titleItem: Resourses.Features.payloadWeightsString,
				firstStat: UnitsOfMass.kilograms.rawValue,
				secondStat: UnitsOfMass.pound.rawValue,
				activeItem: userSettings.payloadWeights.rawValue)
		]
		return settingsViewModel
	}
}
