import UIKit

final class SettingsPresenter {
	weak var view: SettingsViewInput?
	weak var moduleOutput: SettingsModuleOutput?

	private let router: SettingsRouterInput
	private let interactor: SettingsInteractorInput

	init(
		router: SettingsRouterInput,
		interactor: SettingsInteractorInput
	) {
		self.router = router
		self.interactor = interactor
	}
}

extension SettingsPresenter: SettingsModuleInput {}

extension SettingsPresenter: SettingsViewOutput {
	func viewDidLoad(){
		view?.set(title: Resourses.Settings.titleSectionString)
		interactor.getSettingsData()
	}

	func closeBtnTapped() {
		router.closeSettinsModule()
	}
}

extension SettingsPresenter: SettingsInteractorOutput {}

extension SettingsPresenter: SettingsSegmentedControlDelegate {
	func change(toIndex: Int) {
			print("segmentedControl index changed to \(toIndex)")
	}
}
