import UIKit

final class MainContainer {
	let input: MainModuleInput
	let viewController: UIViewController
	private weak var router: MainRouterInput?

	static func assemble(routingHandler: MainRouterRoutingHandler,
								moduleOutput: MainModuleOutput?) -> MainContainer {
		let router = MainRouter()
		let interactor = MainInteractor()
		let presenter = MainPresenter(router: router, interactor: interactor)
		let viewController = MainViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = moduleOutput

		interactor.output = presenter

		router.routingHandler = routingHandler

		return MainContainer(view: viewController, input: presenter, router: router)
	}

	private init(view: UIViewController, input: MainModuleInput, router: MainRouterInput) {
		self.viewController = view
		self.input = input
		self.router = router
	}
}
