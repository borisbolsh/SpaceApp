import Foundation

protocol DataSettingsServiceProtocol {
	func getSettings(completion: @escaping (UserSettings?) -> Void)
	func setSettings(settings: UserSettings)
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
		if let settings: UserSettings = readValue(key: KeyConstants.settingsKey.rawValue) {
			completion(settings)
		}
		completion(nil)
	}

	func setSettings(settings: UserSettings) {
		userDefaults.set(settings, forKey: KeyConstants.settingsKey.rawValue)
	}

	private func saveValue(key: String, value: Any) {
		userDefaults.set(value, forKey: key)
	}

	private func readValue<T>(key: String) -> T? {
		return userDefaults.value(forKey: key) as? T
	}
}
