import Foundation

final class DetailsInteractor {
	weak var output: DetailsInteractorOutput?
	
	private let spacexDataNetworkService: SpacexDataNetworkServiceProtocol

	init(spacexDataNetworkService: SpacexDataNetworkServiceProtocol) {
		self.spacexDataNetworkService = spacexDataNetworkService
	}
}

extension DetailsInteractor: DetailsInteractorInput {
	func getLaunchesData() {
		spacexDataNetworkService.obtainLaunchesHistory { [weak self] result in
			guard let self = self else {
				return
			}

			switch result {
			case .success(let response):
				self.output?.didRecieveLaunches(launches: response)
			case .failure(let error):
				print(error)
			}
		}
	}
}
