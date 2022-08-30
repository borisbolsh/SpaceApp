import UIKit

final class MainPresenter {
	weak var view: MainViewInput?
	weak var moduleOutput: MainModuleOutput?

	private let router: MainRouterInput
	private let interactor: MainInteractorInput
	private let userSettingsFactory: UserSettingsFactoryProtocol

	private let rocketViewModelsMapper = RocketViewModelMapper()
	private var userSettings: UserSettings?

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

extension MainPresenter: MainModuleInput {}

//MARK: Private

extension MainPresenter {
	private func showError() {
		print("show error alert")
	}
}

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
		guard let userSettings = userSettings else {
			return
		}

		let viewModels = rocketViewModelsMapper.map(rocketItems: rockets, userSettings: userSettings)
		view?.set(viewModels: viewModels)
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
