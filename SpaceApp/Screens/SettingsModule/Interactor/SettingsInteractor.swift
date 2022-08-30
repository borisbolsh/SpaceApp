import Foundation

final class SettingsInteractor {
	weak var output: SettingsInteractorOutput?
	
	private let settingsService: DataSettingsServiceProtocol

	init(settingsService: DataSettingsServiceProtocol) {
		self.settingsService = settingsService
	}
}

extension SettingsInteractor: SettingsInteractorInput {
	func getSettingsData() {
		settingsService.getSettings{ [weak self] result in
			guard let self = self else {
				return
			}
			if let result = result {
				self.output?.didRecieveUserSettings(settings: result)
			} else {
				self.output?.didRecieveNoUserSettings()
			}
		}
	}

	func setSettingsData(settings: UserSettings) {
		settingsService.setSettings(settings: settings) { result in
//			guard let self = self else {
//				return
//			}
			if result {
				print("settings saved")
			} else {
				print("somthing wrong")
			}
		}
	}
}
