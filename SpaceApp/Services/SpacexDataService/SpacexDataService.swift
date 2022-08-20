import Foundation

typealias RocketsSpacexDataServiceCompletion = ((Result<[RocketsDTO], Error>) -> Void)

typealias LaunchesSpacexDataServiceCompletion = ((Result<[Launches], Error>) -> Void)

protocol SpacexDataNetworkServiceProtocol {
	func obtainRocketsHistory(completion: @escaping RocketsSpacexDataServiceCompletion)
	func obtainLaunchesHistory(completion: @escaping LaunchesSpacexDataServiceCompletion)
}

final class SpacexDataNetworkService: NetworkServiceProtocol, SpacexDataNetworkServiceProtocol {
	private enum UrlConstants: String {
		case getRockets = "https://api.spacexdata.com/v4/rockets"
		case getLaunches = "https://api.spacexdata.com/v4/launches"
	}

	func obtainRocketsHistory(completion: @escaping RocketsSpacexDataServiceCompletion) {
		self.baseRequest(url: UrlConstants.getRockets.rawValue, completion: completion)
	}

	func obtainLaunchesHistory(completion: @escaping LaunchesSpacexDataServiceCompletion) {
		self.baseRequest(url: UrlConstants.getLaunches.rawValue, completion: completion)
	}
}
