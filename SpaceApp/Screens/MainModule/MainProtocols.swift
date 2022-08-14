import Foundation

protocol MainModuleInput {}

protocol MainModuleOutput: AnyObject {}

protocol MainViewInput: AnyObject {}

protocol MainViewOutput: AnyObject {
	func viewDidLoad()
}

protocol MainInteractorInput: AnyObject {}

protocol MainInteractorOutput: AnyObject {}

protocol MainRouterInput: AnyObject {}

protocol MainRouterRoutingHandler: AnyObject {}
