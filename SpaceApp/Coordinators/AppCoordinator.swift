import UIKit

protocol Coordinator: AnyObject {
	var childCoordinators: [Coordinator] { get set }

	func start()
}

final class AppCoordinator: Coordinator {
	private let window: UIWindow
	private let appDependency: AppDependency
	var childCoordinators: [Coordinator]

	let navigationController = UINavigationController()

	init(window: UIWindow, appDependency: AppDependency) {
		self.window = window
		self.appDependency = appDependency
		self.childCoordinators = []
	}

	func start() {
		window.rootViewController = self.navigationController
		showMain()
		window.makeKeyAndVisible()
	}

	private func showMain() {

		let coordinator = MainCoordinator(navigationController: navigationController,
																			appDependency: appDependency)
		childCoordinators = [coordinator]
		coordinator.start()
	}
}
