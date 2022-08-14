import UIKit

final class MainCoordinator: Coordinator {
	var childCoordinators: [Coordinator]
	
	private let navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
		self.childCoordinators = []
	}

	func start() {
		self.setupMain()
	}

	private func setupMain() {
		let container = MainContainer.assemble(routingHandler: self,
																						 moduleOutput: nil)

		navigationController.setViewControllers([container.viewController], animated: false)

	}
}

extension MainCoordinator: MainRouterRoutingHandler {}
