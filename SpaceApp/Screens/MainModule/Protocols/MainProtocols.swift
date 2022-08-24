import Foundation

protocol MainModuleInput {}

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
}

protocol MainInteractorOutput: AnyObject {
	func didRecieveRockets(rockets: [RocketsDTO])
}

protocol MainRouterInput: AnyObject {
	func routeToDetails()
}

protocol MainRouterRoutingHandler: AnyObject {
	func performRouteToDetails()
}
