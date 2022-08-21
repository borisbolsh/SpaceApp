import UIKit

protocol InfoTextLineViewInput {
	func update(title: String, value: String)
}

final class InfoTextLine: UIView {
	@IBOutlet private var infoItemLabel: UILabel!
	@IBOutlet private var valueInfoItemLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()

		configureUI()
	}
}

extension InfoTextLine {
	private func configureUI() {
		infoItemLabel.font = Resourses.Fonts.primaryText
		infoItemLabel.textColor = Resourses.Colors.infoText

		valueInfoItemLabel.font = Resourses.Fonts.primaryText
		valueInfoItemLabel.textColor = Resourses.Colors.primaryText
	}
}

// MARK: View Input

extension InfoTextLine: InfoTextLineViewInput {
	func update(
		title: String,
		value: String
	) {
		infoItemLabel.text = title
		valueInfoItemLabel.text = value

		layoutIfNeeded()
	}
}
