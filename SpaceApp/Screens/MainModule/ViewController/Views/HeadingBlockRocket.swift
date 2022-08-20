import UIKit

protocol HeadingBlockRocketViewInput {
	func setup(
		title: String,
		output: HeadingBlockRocketViewOutput?
	)
}

protocol HeadingBlockRocketViewOutput: AnyObject {
	func didTaptedSettings()
}

final class HeadingBlockRocket: UIView {
	var output: HeadingBlockRocketViewOutput?

	@IBOutlet private var titleLabel: UILabel!
	@IBOutlet private var settingsImageView: UIImageView!
	@IBOutlet private var settingsBtn: UIButton!

	private let settingImage = Resourses.Images.settings?.withRenderingMode(.alwaysTemplate)

	override func awakeFromNib() {
		super.awakeFromNib()

		configureUI()
	}

	func setup(
		title: String,
		output: HeadingBlockRocketViewOutput?
	) {
		titleLabel.text = title
		self.output = output

		layoutIfNeeded()
	}
}

extension HeadingBlockRocket {
	private func configureUI() {
		titleLabel.font = Resourses.Fonts.sectionTitle
		titleLabel.textColor = Resourses.Colors.primaryText

		settingsImageView.tintColor = Resourses.Colors.lightBackground
		settingsImageView.image = settingImage

		settingsBtn.addTarget(self, action: #selector(didTapOnSettingsBtn), for: .touchUpInside)
	}

	@objc func didTapOnSettingsBtn() {
		output?.didTaptedSettings()
	}
}
