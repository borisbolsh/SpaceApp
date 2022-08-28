import UIKit

final class MainContainer {
	let input: MainModuleInput
	let viewController: UIViewController
	private weak var router: MainRouterInput?

	static func assemble(networkService: SpacexDataNetworkServiceProtocol,
											 settingsService: DataSettingsServiceProtocol,
											 routingHandler: MainRouterRoutingHandler,
											 moduleOutput: MainModuleOutput?) -> MainContainer {
		let router = MainRouter()
		let interactor = MainInteractor(
			spacexDataNetworkService: networkService,
			settingsService: settingsService
		)
		let presenter = MainPresenter(router: router,
																	interactor: interactor,
																	userSettingsFactory: UserSettingsFactory())
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
