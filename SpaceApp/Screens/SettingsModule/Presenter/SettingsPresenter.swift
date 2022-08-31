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
			moduleOutput?.updateUserSettings(userSettings: userSettings)
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
	func changeUserSettings(itemType: SettingsItemType, toActiveItem: String) {
		switch itemType {
		case .height:
			if userSettings?.height.rawValue != toActiveItem {
				self.userSettings?.height = UnitOfLength.feet.rawValue == toActiveItem ? .feet : .meters
				userSettingsDidChanged()
			}
		case .diameter:
			if userSettings?.diameter.rawValue != toActiveItem {
				self.userSettings?.diameter = UnitOfLength.feet.rawValue == toActiveItem ? .feet : .meters
				userSettingsDidChanged()
			}
		case .mass:
			if userSettings?.mass.rawValue != toActiveItem {
				self.userSettings?.mass = UnitsOfMass.kilograms.rawValue == toActiveItem ? .kilograms : .pound
				userSettingsDidChanged()
			}
		case .payloadWeights:
			if userSettings?.payloadWeights.rawValue != toActiveItem {
				self.userSettings?.payloadWeights = UnitsOfMass.kilograms.rawValue == toActiveItem ? .kilograms : .pound
				userSettingsDidChanged()
			}
		}
	}
}

extension SettingsPresenter {
	private func userSettingsDidChanged() {
		if !isChangedUserSettings {
			isChangedUserSettings = true
		}
	}
}

extension SettingsPresenter: SettingsTableCellOutput {
	func didTapOnSegmentedControl() {
		print("didTapOnSegmentedControl")
	}
}
