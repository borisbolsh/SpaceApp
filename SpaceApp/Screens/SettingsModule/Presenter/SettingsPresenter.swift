import UIKit

final class SettingsPresenter {
	weak var view: SettingsViewInput?
	weak var moduleOutput: SettingsModuleOutput?

	private let router: SettingsRouterInput
	private let interactor: SettingsInteractorInput

	private var userSettings: UserSettings?
	private let userSettingsFactory: UserSettingsFactoryProtocol

	init(
		userSettingsFactory: UserSettingsFactoryProtocol,
		router: SettingsRouterInput,
		interactor: SettingsInteractorInput
	) {
		self.userSettingsFactory = userSettingsFactory
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

extension SettingsPresenter: SettingsInteractorOutput {
	func didRecieveUserSettings(settings: UserSettings) {
		self.userSettings = settings

		let settingsViewModels = userSettingsFactory.createSettingsViewModels(userSettings: settings)
		view?.set(viewModels: settingsViewModels)
	}

	func didRecieveNoUserSettings() {
		userSettings = userSettingsFactory.createFirstSettings()
	}
}

extension SettingsPresenter: SettingsSegmentedControlDelegate {
	func change(toIndex: Int) {
			print("segmentedControl index changed to \(toIndex)")
	}
}

extension SettingsPresenter: SettingsTableCellOutput {
	func didTapOnSegmentedControl() {
		print("didTapOnSegmentedControl")
	}
}
