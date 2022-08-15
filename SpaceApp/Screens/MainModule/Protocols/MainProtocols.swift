import Foundation

protocol MainModuleInput {}

protocol MainModuleOutput: AnyObject {}

protocol MainViewInput: AnyObject {}

protocol MainViewOutput: AnyObject {
	func viewDidLoad()
}

protocol MainInteractorInput: AnyObject {
	func getRocketsData()
}

protocol MainInteractorOutput: AnyObject {
	func didRecieveRockets(rockets: [Rockets])
}

protocol MainRouterInput: AnyObject {}

protocol MainRouterRoutingHandler: AnyObject {}
