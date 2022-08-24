import UIKit

final class DetailsPresenter {
	weak var view: DetailsViewInput?
	weak var moduleOutput: DetailsModuleOutput?

	private let router: DetailsRouterInput
	private let interactor: DetailsInteractorInput
	private let rocketViewModelsMapper = RocketViewModelMapper()

	init(router: DetailsRouterInput, interactor: DetailsInteractorInput) {
			self.router = router
			self.interactor = interactor
	}
}

extension DetailsPresenter: DetailsModuleInput {}

extension DetailsPresenter: DetailsViewOutput {
	func viewDidLoad(){}
}

extension DetailsPresenter: DetailsInteractorOutput {}
