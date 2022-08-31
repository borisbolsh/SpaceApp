import UIKit

final class MainCoordinator: Coordinator {
	var childCoordinators: [Coordinator]

	private let appDependency: AppDependency
	private let navigationController: UINavigationController

	private var mainModulInput: MainModuleInput?

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
			networkService: appDependency.networkService,
			settingsService: appDependency.settingsService,
			routingHandler: self,
			moduleOutput: nil
		)

		mainModulInput = container.input

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

	private func settingsModule() {
		let container = SettingsContainer.assemble(
			settingsService: appDependency.settingsService,
			routingHandler: self,
			moduleOutput: self
		)

		let settingsNavigationController = UINavigationController()
		settingsNavigationController.setViewControllers([container.viewController], animated: true)
		navigationController.present(settingsNavigationController, animated: true, completion: nil)
	}
}

extension MainCoordinator: MainRouterRoutingHandler {
	func performRouteToDetails(idRocket: String, nameRocket: String) {
		detailsModule(idRocket: idRocket, nameRocket: nameRocket)
	}

	func performRouteToSettings() {
		settingsModule()
	}
}

extension MainCoordinator: DetailsRouterRoutingHandler {}
extension MainCoordinator: SettingsRouterRoutingHandler {
	func performCloseSettinsModule() {
		navigationController.dismiss(animated: true, completion: nil)
	}
}

extension MainCoordinator: SettingsModuleOutput {
	func updateUserSettings(userSettings: UserSettings) {
		mainModulInput?.updateUserSettings(userSettings: userSettings)
	}
}
