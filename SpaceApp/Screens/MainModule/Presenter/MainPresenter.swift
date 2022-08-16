import UIKit

final class MainPresenter {
	weak var view: MainViewInput?
	weak var moduleOutput: MainModuleOutput?

	private let router: MainRouterInput
	private let interactor: MainInteractorInput

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
}
extension MainPresenter: MainInteractorOutput {
	func didRecieveRockets(rockets: [Rockets]) {
		print(rockets)
	}

	func didRecieveError() {
		showError()
	}
}
