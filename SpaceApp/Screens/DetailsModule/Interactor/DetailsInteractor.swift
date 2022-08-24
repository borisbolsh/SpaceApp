import Foundation

final class DetailsInteractor {
	weak var output: DetailsInteractorOutput?
	
	private let spacexDataNetworkService: SpacexDataNetworkServiceProtocol

	init(spacexDataNetworkService: SpacexDataNetworkServiceProtocol) {
		self.spacexDataNetworkService = spacexDataNetworkService
	}
}

extension DetailsInteractor: DetailsInteractorInput {

}
