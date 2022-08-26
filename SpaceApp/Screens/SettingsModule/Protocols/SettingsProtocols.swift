import Foundation

protocol SettingsModuleInput {}

protocol SettingsModuleOutput: AnyObject {}

protocol SettingsViewInput: AnyObject {
	func set(title: String)
}

protocol SettingsViewOutput: AnyObject {
	func viewDidLoad()
}

protocol SettingsInteractorInput: AnyObject {}

protocol SettingsInteractorOutput: AnyObject {}

protocol SettingsRouterInput: AnyObject {}

protocol SettingsRouterRoutingHandler: AnyObject {}
