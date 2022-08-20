import UIKit

final class RocketViewModelMapper {
	func map(rocketItems: [RocketsDTO]) -> [RocketViewModel] {
		let results = rocketItems.map { RocketViewModel(info: $0.name,
																										title: $0.company,
																										shortDescription: $0.description,
																										imageName: ($0.images.first ?? "") ?? "")
		}

		return results
	}
}
