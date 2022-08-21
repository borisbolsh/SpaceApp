import UIKit

enum Resourses {
	enum Colors {
		/// Background colors

		static let primaryBackground = UIColor(hexString: "#000000")
		static let secondaryBackground = UIColor(hexString: "#212121")
		static let lightBackground = UIColor(hexString: "#FFFFFF")
		static let buttonBackground = UIColor(hexString: "#212121")

		/// Text colors

		static let primaryText = UIColor(hexString: "#F6F6F6")
		static let secondaryText = UIColor(hexString: "#8E8E8F")
		static let infoText = UIColor(hexString: "#CACACA")
		static let lightText = UIColor(hexString: "#FFFFFF")
	}

	enum Images {
		static let settings = UIImage(named: "settings-icon")
		static let rocket = UIImage(named: "rocket-icon")
	}

	enum Fonts {
		static let sectionTitle = UIFont.systemFont(ofSize: 24.0)
		static let primaryText = UIFont.systemFont(ofSize: 16.0)
		static let secondaryBoldText = UIFont.boldSystemFont(ofSize: 16.0)
		static let secondaryInfoText = UIFont.systemFont(ofSize: 14.0)
	}

	enum Features {
		static let heightString = "Высота"
		static let diameterString = "Диаметр"
		static let massString = "Масса"
		static let payloadWeightsString = "Hагрузка"
	}

	enum MainInfo {
		static let firstFlyString = "Первый запуск"
		static let countryString = "Страна"
		static let flyPriceString = "Стоимость запуска"
	}

	enum StageInfo {
		static let firstStageTitleString = "Первая ступень"
		static let secondStageTitleString = "Вторая ступень"
		static let enginesString = "Количество двигателей"
		static let fuelString = "Количество топлива"
		static let burnTimeString = "Время сгорания"
	}

	enum Units {
		static let seconds = "sec"
		static let tons = "ton"
	}

	enum Buttons {
		static let launchesButtonString = "Посмотреть запуски"
	}
}
