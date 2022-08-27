import Foundation

protocol SettingsModuleInput {}

protocol SettingsModuleOutput: AnyObject {}

protocol SettingsViewInput: AnyObject {
	func set(title: String)
}

protocol SettingsViewOutput: AnyObject {
	func viewDidLoad()
	func closeBtnTapped()
}

protocol SettingsInteractorInput: AnyObject {
	func getSettingsData()
}

protocol SettingsInteractorOutput: AnyObject {}

protocol SettingsRouterInput: AnyObject {
	func closeSettinsModule()
}

protocol SettingsRouterRoutingHandler: AnyObject {}
