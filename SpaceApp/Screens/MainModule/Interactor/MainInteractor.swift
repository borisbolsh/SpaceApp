import Foundation

final class MainInteractor {
	weak var output: MainInteractorOutput?

	private let spacexDataNetworkService: SpacexDataNetworkServiceProtocol
	private let settingsService: DataSettingsServiceProtocol

	init(spacexDataNetworkService: SpacexDataNetworkServiceProtocol,
			 settingsService: DataSettingsServiceProtocol) {
		self.spacexDataNetworkService = spacexDataNetworkService
		self.settingsService = settingsService
	}
}

extension MainInteractor: MainInteractorInput {
	func getSettingsData() {
		settingsService.getSettings{ [weak self] result in
			guard let self = self else {
				return
			}
			if let result = result {
				self.output?.didRecieveUserSettings(settings: result)
			} else {
				self.output?.didRecieveNoUserSettings()
			}
		}
	}

	func getRocketsData() {
		spacexDataNetworkService.obtainRocketsHistory	{ [weak self] result in
			guard let self = self else {
				return
			}

			switch result {
			case .success(let response):
				self.output?.didRecieveRockets(rockets: response)
			case .failure(let error):
				print(error)
			}
		}
	}
}
