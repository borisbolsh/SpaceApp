import UIKit

final class MainCoordinator: Coordinator {
	var childCoordinators: [Coordinator]

	private let appDependency: AppDependency
	private let navigationController: UINavigationController

	init(navigationController: UINavigationController,
			 appDependency: AppDependency) {
		self.navigationController = navigationController
		self.appDependency = appDependency
		self.childCoordinators = []
	}

	func start() {
		self.setupMain()
	}

	private func setupMain() {
		let container = MainContainer.assemble(
			service: appDependency.networkService,
			routingHandler: self,
			moduleOutput: nil
		)

		navigationController.setViewControllers(
			[container.viewController],
			animated: false
		)
	}

	private func detailsModule(idRocket: String, nameRocket: String) {
		let container = DetailsContainer.assemble(
			idRocket: idRocket,
			nameRocket: nameRocket,
			service: appDependency.networkService,
			routingHandler: self,
			moduleOutput: nil
		)
		navigationController.popViewController(animated: true)
		navigationController.pushViewController(container.viewController, animated: true)
	}
}

extension MainCoordinator: MainRouterRoutingHandler {
	func performRouteToDetails(idRocket: String, nameRocket: String) {
		detailsModule(idRocket: idRocket, nameRocket: nameRocket)
	}
}

extension MainCoordinator: DetailsRouterRoutingHandler {}
