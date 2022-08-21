import UIKit

final class RocketViewModelMapper {
	func map(rocketItems: [RocketsDTO]) -> [RocketViewModel] {
		let results = rocketItems.map {
			RocketViewModel(
				id: $0.id,
				info: $0.name,
				title: $0.company,
				shortDescription: $0.description,
				imageName: ($0.images.first ?? "") ?? "",
				features: [
					FeatureViewModel(
						title: String($0.height.feet),
						subtitle: "\(Resourses.Features.heightString), ft"
					),
					FeatureViewModel(
						title: String($0.diameter.feet),
						subtitle: "\(Resourses.Features.diameterString), ft"
					),
					FeatureViewModel(
						title: String($0.mass.lb),
						subtitle: "\(Resourses.Features.massString), lb"
					),
					FeatureViewModel(
						title: String($0.payloadWeightsRocket.filter{ $0.id == "leo" }.first?.lb ?? 1),
						subtitle: "\(Resourses.Features.payloadWeightsString), lb"
					)
				],
				mainInfo: [
					MainInfoViewModel(
						info: Resourses.MainInfo.firstFlyString,
						value: $0.firstFlight),
					MainInfoViewModel(
						info: Resourses.MainInfo.countryString,
						value: $0.country),
					MainInfoViewModel(
						info: Resourses.MainInfo.flyPriceString,
						value: String($0.price))
				],
				firstStageInfo: StageInfoViewModel(
					headingStage: Resourses.StageInfo.firstStageTitleString,
					stageViewModels: [
						StageInfoItemViewModel(
							titleItem: Resourses.StageInfo.enginesString,
							valueItem: String($0.firstStageRocket.engines),
							valueDescItem: nil
						),
						StageInfoItemViewModel(
							titleItem: Resourses.StageInfo.fuelString,
							valueItem: String($0.firstStageRocket.fuelAmountTons),
							valueDescItem: Resourses.Units.tons
						),
						StageInfoItemViewModel(
							titleItem: Resourses.StageInfo.burnTimeString,
							valueItem: String($0.firstStageRocket.burnTimeSec ?? 0),
							valueDescItem: Resourses.Units.seconds
						)
					]),
				secondStageInfo: StageInfoViewModel(
					headingStage: Resourses.StageInfo.secondStageTitleString,
					stageViewModels: [
						StageInfoItemViewModel(
							titleItem: Resourses.StageInfo.enginesString,
							valueItem: String($0.secondStageRocket.engines),
							valueDescItem: nil
						),
						StageInfoItemViewModel(
							titleItem: Resourses.StageInfo.fuelString,
							valueItem: String($0.secondStageRocket.fuelAmountTons),
							valueDescItem: Resourses.Units.tons
						),
						StageInfoItemViewModel(
							titleItem: Resourses.StageInfo.burnTimeString,
							valueItem: String($0.secondStageRocket.burnTimeSec ?? 0),
							valueDescItem: Resourses.Units.seconds
						)
					]
				)
			)
		}

		return results
	}
}
