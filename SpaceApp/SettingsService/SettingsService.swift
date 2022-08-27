import Foundation

protocol DataSettingsService {
	func getSettings(key: String) -> [String: AnyHashable]?
	func setSettings(settings: [String: AnyHashable], key: String)
}

final class SettingsService: DataSettingsService {
	private let userDefaults: UserDefaults

	init(userDefaults: UserDefaults = .standard) {
		self.userDefaults = userDefaults
	}

	func getSettings(key: String) -> [String: AnyHashable]? {
		guard let settings: [String: AnyHashable] = readValue(key: key) else {
			return nil
		}
		return settings
	}

	func setSettings(settings: [String: AnyHashable], key: String) {
		userDefaults.set(settings, forKey: key)
	}

	private func saveValue(key: String, value: Any) {
		userDefaults.set(value, forKey: key)
	}

	private func readValue<T>(key: String) -> T? {
		return userDefaults.value(forKey: key) as? T
	}
}
