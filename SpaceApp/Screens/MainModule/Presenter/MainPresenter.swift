import UIKit

final class MainPresenter {
	weak var view: MainViewInput?
	weak var moduleOutput: MainModuleOutput?

	private let router: MainRouterInput
	private let interactor: MainInteractorInput
	private let rocketViewModelsMapper = RocketViewModelMapper()

	init(router: MainRouterInput, interactor: MainInteractorInput) {
			self.router = router
			self.interactor = interactor
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
		interactor.getRocketsData()
	}

	func didSwipeLeft() {
		view?.showNextRocket()
	}

	func didSwipeRight() {
		view?.showPreviousRocket()
	}
}

extension MainPresenter: MainInteractorOutput {
	func didRecieveRockets(rockets: [RocketsDTO]) {
		let viewModels = rocketViewModelsMapper.map(rocketItems: rockets)
		view?.set(viewModels: viewModels)
	}

	func didRecieveError() {
		showError()
	}
}

extension MainPresenter: HeadingBlockRocketViewOutput {
	func didTapOnSettings() {
		// TODO: route to settings
	}
}

extension MainPresenter: ButtonLaunchesBlockRocketViewOutput {
	func didTapOnShowLaunches(idRocket: String, nameRocket: String) {
//		print(idRocket + nameRocket)
		router.routeToDetails(idRocket: idRocket, nameRocket: nameRocket)
	}
}
