import Foundation

protocol FeedModuleInput {
		var moduleOutput: FeedModuleOutput? { get }
}

protocol FeedModuleOutput: AnyObject {}

protocol FeedViewInput: AnyObject {}

protocol FeedViewOutput: AnyObject {
		func viewDidLoad()
}

protocol FeedInteractorInput: AnyObject {}

protocol FeedInteractorOutput: AnyObject {}

protocol FeedRouterInput: AnyObject {}
