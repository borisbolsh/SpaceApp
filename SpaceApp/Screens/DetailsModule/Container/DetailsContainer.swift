import UIKit

final class DetailsContainer {
	let input: DetailsModuleInput
	let viewController: UIViewController
	private weak var router: DetailsRouterInput?

	static func assemble(idRocket: String,
											 nameRocket: String,
											 service: SpacexDataNetworkServiceProtocol,
											 routingHandler: DetailsRouterRoutingHandler,
											 moduleOutput: DetailsModuleOutput?) -> DetailsContainer {
		let router = DetailsRouter()
		let interactor = DetailsInteractor(spacexDataNetworkService: service)
		let presenter = DetailsPresenter(idRocket: idRocket,
																		 nameRocket: nameRocket,
																		 router: router,
																		 interactor: interactor)
		let viewController = DetailsViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = moduleOutput

		interactor.output = presenter

		router.routingHandler = routingHandler

		return DetailsContainer(view: viewController, input: presenter, router: router)
	}

	private init(view: UIViewController, input: DetailsModuleInput, router: DetailsRouterInput) {
		self.viewController = view
		self.input = input
		self.router = router
	}
}
