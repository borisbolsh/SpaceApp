import UIKit

final class MainPresenter {
	weak var view: MainViewInput?
	weak var moduleOutput: MainModuleOutput?

	private let router: MainRouterInput
	private let interactor: MainInteractorInput
	private let userSettingsFactory: UserSettingsFactoryProtocol

	private let rocketViewModelsMapper = RocketViewModelMapper()
	private var userSettings: UserSettings?
	private var rockets: [RocketsDTO]?

	init(
		router: MainRouterInput,
		interactor: MainInteractorInput,
		userSettingsFactory: UserSettingsFactoryProtocol
	) {
		self.router = router
		self.interactor = interactor
		self.userSettingsFactory = userSettingsFactory
	}
}

// MARK: Module input

extension MainPresenter: MainModuleInput {
	func updateUserSettings(userSettings: UserSettings) {
		self.userSettings = userSettings

		guard let rockets = rockets else {
			return
		}
		showRockets(rocketItems: rockets)
	}
}

// MARK: Private

extension MainPresenter {
	private func showError() {
		print("show error alert")
	}

	private func showRockets(rocketItems: [RocketsDTO]) {
		guard let userSettings = userSettings else {
			return
		}

		let viewModels = rocketViewModelsMapper.map(rocketItems: rocketItems, userSettings: userSettings)
		view?.set(viewModels: viewModels)
	}
}

// MARK: View output

extension MainPresenter: MainViewOutput {
	func viewDidLoad(){
		interactor.getSettingsData()
	}

	func didSwipeLeft() {
		view?.showNextRocket()
	}

	func didSwipeRight() {
		view?.showPreviousRocket()
	}
}

// MARK: Interactor output

extension MainPresenter: MainInteractorOutput {
	func didRecieveUserSettings(settings: UserSettings) {
		self.userSettings = settings
		interactor.getRocketsData()
	}

	func didRecieveNoUserSettings() {
		userSettings = userSettingsFactory.createFirstSettings()
		if let userSettings = userSettings {
			interactor.setSettingsData(settings: userSettings)
		}
		interactor.getRocketsData()
	}

	func didRecieveRockets(rockets: [RocketsDTO]) {
		self.rockets = rockets
		showRockets(rocketItems: rockets)
	}

	func didRecieveError() {
		showError()
	}
}

extension MainPresenter: HeadingBlockRocketViewOutput {
	func didTapOnSettings() {
		router.routeToSettings()
	}
}

extension MainPresenter: ButtonLaunchesBlockRocketViewOutput {
	func didTapOnShowLaunches(idRocket: String, nameRocket: String) {
		router.routeToDetails(idRocket: idRocket, nameRocket: nameRocket)
	}
}
