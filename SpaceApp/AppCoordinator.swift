import UIKit

protocol Coordinator: AnyObject {
	var childCoordinators: [Coordinator] { get set }

	func start()
}

final class AppCoordinator: Coordinator {
	private let window: UIWindow
	var childCoordinators: [Coordinator]

	let navigationController = UINavigationController()

	init(window: UIWindow) {
		self.window = window
		self.childCoordinators = []
	}

	func start() {
		window.rootViewController = self.navigationController
		showMain()
		window.makeKeyAndVisible()
	}

	private func showMain() {

		let coordinator = MainCoordinator(navigationController: navigationController)
		childCoordinators = [coordinator]
		coordinator.start()
	}
}
