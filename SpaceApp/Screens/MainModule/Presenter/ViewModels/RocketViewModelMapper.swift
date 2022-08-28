import UIKit

final class RocketViewModelMapper {
	func map(rocketItems: [RocketsDTO], userSettings: UserSettings) -> [RocketViewModel] {
		let results = rocketItems.map {
			RocketViewModel(
				id: $0.id,
				title: $0.name,
				shortDescription: $0.description,
				imageName: ($0.images.first ?? "") ?? "",
				features: [
					FeatureViewModel(
						title: userSettings.height == .feet ? String($0.height.feet) : String($0.height.meters),
						subtitle: "\(Resourses.Features.heightString), \(userSettings.height.rawValue)"
					),
					FeatureViewModel(
						title: userSettings.diameter == .feet ?  String($0.diameter.feet) : String($0.diameter.meters),
						subtitle: "\(Resourses.Features.diameterString), \(userSettings.diameter.rawValue)"
					),
					FeatureViewModel(
						title: userSettings.mass == .pound ? String($0.mass.lb) : String($0.mass.kg) ,
						subtitle: "\(Resourses.Features.massString), \(userSettings.mass.rawValue)"
					),
					FeatureViewModel(
						title: userSettings.payloadWeights == .pound ? String($0.payloadWeightsRocket.filter{ $0.id == "leo" }.first?.lb ?? 1) : String($0.payloadWeightsRocket.filter{ $0.id == "leo" }.first?.kg ?? 1),
						subtitle: "\(Resourses.Features.payloadWeightsString), \(userSettings.payloadWeights.rawValue)"
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
