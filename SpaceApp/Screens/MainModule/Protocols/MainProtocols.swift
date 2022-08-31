import Foundation

protocol MainModuleInput {
	func updateUserSettings(userSettings: UserSettings)
}

protocol MainModuleOutput: AnyObject {}

protocol MainViewInput: AnyObject {
	func set(viewModels: [RocketViewModel])
	func showPreviousRocket()
	func showNextRocket()
}

protocol MainViewOutput: AnyObject {
	func viewDidLoad()
	func didSwipeRight()
	func didSwipeLeft()
}

protocol MainInteractorInput: AnyObject {
	func getRocketsData()
	func getSettingsData()
	func setSettingsData(settings: UserSettings)
}

protocol MainInteractorOutput: AnyObject {
	func didRecieveRockets(rockets: [RocketsDTO])
	func didRecieveUserSettings(settings: UserSettings)
	func didRecieveNoUserSettings()
}

protocol MainRouterInput: AnyObject {
	func routeToSettings()
	func routeToDetails(idRocket: String, nameRocket: String)
}

protocol MainRouterRoutingHandler: AnyObject {
	func performRouteToSettings()
	func performRouteToDetails(idRocket: String, nameRocket: String)
}
