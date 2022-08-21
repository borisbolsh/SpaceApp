import Foundation

struct RocketViewModel {
	let id: String
	let info: String
	let title: String
	let shortDescription: String
	let imageName: String
	let features: [FeatureViewModel]?
	let mainInfo: [MainInfoViewModel]?
	let firstStageInfo: StageInfoViewModel?
	let secondStageInfo: StageInfoViewModel?
}

struct FeatureViewModel {
	let title: String
	let subtitle: String
}

struct MainInfoViewModel {
	let info: String
	let value: String
}

struct StageInfoViewModel {
	let headingStage: String
	let stageViewModels: [StageInfoItemViewModel]?
}

struct StageInfoItemViewModel {
	let titleItem: String
	let valueItem: String?
	let valueDescItem: String?
}
