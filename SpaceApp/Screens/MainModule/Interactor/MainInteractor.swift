import Foundation

final class MainInteractor {
	weak var output: MainInteractorOutput?

	private let spacexDataNetworkService: SpacexDataNetworkServiceProtocol

	init(spacexDataNetworkService: SpacexDataNetworkServiceProtocol) {
		self.spacexDataNetworkService = spacexDataNetworkService
	}
}

extension MainInteractor: MainInteractorInput {
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
