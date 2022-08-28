import Foundation

protocol SettingsModuleInput {}

protocol SettingsModuleOutput: AnyObject {}

protocol SettingsViewInput: AnyObject {
	func set(title: String)
	func set(viewModels: [SettingsViewModel])
}

protocol SettingsViewOutput: AnyObject {
	func viewDidLoad()
	func closeBtnTapped()
}

protocol SettingsInteractorInput: AnyObject {
	func getSettingsData()
}

protocol SettingsInteractorOutput: AnyObject {
	func didRecieveUserSettings(settings: UserSettings)
	func didRecieveNoUserSettings()
}

protocol SettingsRouterInput: AnyObject {
	func closeSettinsModule()
}

protocol SettingsRouterRoutingHandler: AnyObject {}
