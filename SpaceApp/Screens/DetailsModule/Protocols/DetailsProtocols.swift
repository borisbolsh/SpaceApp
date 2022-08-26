import Foundation

protocol DetailsModuleInput {}

protocol DetailsModuleOutput: AnyObject {}

protocol DetailsViewInput: AnyObject {
	func set(title: String)
	func set(viewModels: [LaunchViewModel])
}

protocol DetailsViewOutput: AnyObject {
	func viewDidLoad()
}

protocol DetailsInteractorInput: AnyObject {
	func getLaunchesData()
}

protocol DetailsInteractorOutput: AnyObject {
	func didRecieveLaunches(launches: [LaunchDTO])
}

protocol DetailsRouterInput: AnyObject {}

protocol DetailsRouterRoutingHandler: AnyObject {}
