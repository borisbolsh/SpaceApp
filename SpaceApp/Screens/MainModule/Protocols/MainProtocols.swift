import Foundation

protocol MainModuleInput {}

protocol MainModuleOutput: AnyObject {}

protocol MainViewInput: AnyObject {
	func set(viewModels: [RocketViewModel])
}

protocol MainViewOutput: AnyObject {
	func viewDidLoad()
}

protocol MainInteractorInput: AnyObject {
	func getRocketsData()
}

protocol MainInteractorOutput: AnyObject {
	func didRecieveRockets(rockets: [RocketsDTO])
}

protocol MainRouterInput: AnyObject {}

protocol MainRouterRoutingHandler: AnyObject {}
