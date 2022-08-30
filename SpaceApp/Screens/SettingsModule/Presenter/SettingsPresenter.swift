import UIKit

final class SettingsPresenter {
	weak var view: SettingsViewInput?
	weak var moduleOutput: SettingsModuleOutput?

	private let router: SettingsRouterInput
	private let interactor: SettingsInteractorInput

	private var userSettings: UserSettings?
	private let userSettingsFactory: UserSettingsFactoryProtocol
	private var isChangedUserSettings = false

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

	func viewWillDisappear() {
		if isChangedUserSettings {
			guard let userSettings = userSettings else {
				return
			}
			interactor.setSettingsData(settings: userSettings)
		}
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
		if let userSettings = userSettings {
			let userSettingsViewModel = userSettingsFactory.createSettingsViewModels(userSettings: userSettings)
			view?.set(viewModels: userSettingsViewModel)
		}
	}
}

extension SettingsPresenter: SettingsSegmentedControlDelegate {
	func change(itemType: SettingsItemType, toActiveItem: String) {
		print("\(itemType) changed to - \(toActiveItem)")

		guard let userSettings = userSettings else {
			return
		}
//		let itemStr = String(describing: itemType)

//		let mirror = Mirror(reflecting: userSettings)
//		for child in mirror.children  {
//				print("key: \(child.label), value: \(child.value)")
//		}
//		let itemStr = String(describing: itemType)
//		let itemKey = mirror.children.filter{ $0.label == itemStr }
	}
}

extension SettingsPresenter: SettingsTableCellOutput {
	func didTapOnSegmentedControl() {
		print("didTapOnSegmentedControl")
	}
}
