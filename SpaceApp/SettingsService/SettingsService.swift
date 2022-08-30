import Foundation

protocol DataSettingsServiceProtocol {
	func getSettings(completion: @escaping (UserSettings?) -> Void)
	func setSettings(settings: UserSettings, completion: @escaping (Bool) -> Void)
}

final class SettingsService: DataSettingsServiceProtocol {
	private enum KeyConstants: String {
		case settingsKey = "Settings"
	}

	private let userDefaults: UserDefaults

	init(userDefaults: UserDefaults = .standard) {
		self.userDefaults = userDefaults
	}

	func getSettings(completion: @escaping (UserSettings?) -> Void) {
		if let settings = userDefaults.object(forKey: KeyConstants.settingsKey.rawValue) as? Data {
			if let userSettings = try? JSONDecoder().decode(UserSettings.self, from: settings) {
				return completion(userSettings)
			}
		}
		return completion(nil)
	}

	func setSettings(settings: UserSettings, completion: @escaping (Bool) -> Void) {
		if let encoded = try? JSONEncoder().encode(settings) {
			userDefaults.set(encoded, forKey: KeyConstants.settingsKey.rawValue)
			return completion(true)
		}
		return completion(false)
	}
}
