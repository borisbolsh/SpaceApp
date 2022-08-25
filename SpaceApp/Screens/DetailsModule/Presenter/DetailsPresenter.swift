import UIKit

final class DetailsPresenter {
	weak var view: DetailsViewInput?
	weak var moduleOutput: DetailsModuleOutput?

	private let router: DetailsRouterInput
	private let interactor: DetailsInteractorInput
	private let launchViewModelsMapper = LaunchViewModelMapper()
	private var launches: [LaunchDTO] = []
	private var idRocket: String
	private var nameRocket: String

	init(
		idRocket: String,
		nameRocket: String,
		router: DetailsRouterInput,
		interactor: DetailsInteractorInput
	) {
		self.idRocket = idRocket
		self.nameRocket = nameRocket
		self.router = router
		self.interactor = interactor
	}
}

extension DetailsPresenter: DetailsModuleInput {}

extension DetailsPresenter: DetailsViewOutput {
	func viewDidLoad(){
		interactor.getLaunchesData()
	}
}

extension DetailsPresenter: DetailsInteractorOutput {
	func didRecieveLaunches(launches: [LaunchDTO]) {
		self.launches = launches.filter { $0.rocketId == idRocket }
		.sorted(by: { $0.dateLaunchUnix > $1.dateLaunchUnix })

		let viewModels = launchViewModelsMapper.map(launchesItems: self.launches)
		view?.set(viewModels: viewModels)
	}
}
