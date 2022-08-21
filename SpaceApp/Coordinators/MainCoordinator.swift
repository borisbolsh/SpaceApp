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
}

extension MainCoordinator: MainRouterRoutingHandler {}
