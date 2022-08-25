import UIKit

final class LaunchViewModelMapper {
	func map(launchesItems: [LaunchDTO]) -> [LaunchViewModel] {
		let results = launchesItems.map {
			LaunchViewModel(
				idRocket: $0.rocketId,
				nameLaunch: $0.missionName,
				dateLaunch: $0.dateLaunchUnix,
				isSuccess: $0.isLaunchSuccess ?? false
			)
		}

		return results
	}
}
