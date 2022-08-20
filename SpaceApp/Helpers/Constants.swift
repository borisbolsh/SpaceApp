import UIKit

enum Resourses {
	enum Colors {
		/// Background colors

		static let primaryBackground = UIColor(hexString: "#000000")
		static let secondaryBackground = UIColor(hexString: "#212121")
		static let lightBackground = UIColor(hexString: "#FFFFFF")

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
	}
}
