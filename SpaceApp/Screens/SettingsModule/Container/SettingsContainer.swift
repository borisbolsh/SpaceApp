import UIKit

final class SettingsContainer {
	let input: SettingsModuleInput
	let viewController: UIViewController
	private weak var router: SettingsRouterInput?

	static func assemble(settingsService: DataSettingsServiceProtocol,
											 routingHandler: SettingsRouterRoutingHandler,
											 moduleOutput: SettingsModuleOutput?) -> SettingsContainer {
		let router = SettingsRouter()
		let interactor = SettingsInteractor(settingsService: settingsService)
		let presenter = SettingsPresenter(userSettingsFactory: UserSettingsFactory(),
																			router: router,
																			interactor: interactor)
		let viewController = SettingsViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = moduleOutput

		interactor.output = presenter

		router.routingHandler = routingHandler

		return SettingsContainer(view: viewController, input: presenter, router: router)
	}

	private init(view: UIViewController, input: SettingsModuleInput, router: SettingsRouterInput) {
		self.viewController = view
		self.input = input
		self.router = router
	}
}
