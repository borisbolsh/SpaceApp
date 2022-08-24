import Foundation

protocol DetailsModuleInput {}

protocol DetailsModuleOutput: AnyObject {}

protocol DetailsViewInput: AnyObject {}

protocol DetailsViewOutput: AnyObject {
	func viewDidLoad()
}

protocol DetailsInteractorInput: AnyObject {}

protocol DetailsInteractorOutput: AnyObject {}

protocol DetailsRouterInput: AnyObject {}

protocol DetailsRouterRoutingHandler: AnyObject {}
