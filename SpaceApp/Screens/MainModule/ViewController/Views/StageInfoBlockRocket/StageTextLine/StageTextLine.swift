import UIKit

protocol StageTextLineViewInput {
	func update(
		info: String,
		value: String,
		valueDesc: String
	)
}

final class StageTextLine: UIView {
	@IBOutlet private var infoTextLabel: UILabel!
	@IBOutlet private var valueTextLabel: UILabel!
	@IBOutlet private var valueDescTextLabel: UILabel!

	override func awakeFromNib() {
			super.awakeFromNib()
		configureUI()
	}
}

extension StageTextLine {
	private func configureUI() {
		infoTextLabel.font = Resourses.Fonts.primaryText
		infoTextLabel.textColor = Resourses.Colors.infoText

		valueTextLabel.font = Resourses.Fonts.secondaryBoldText
		valueTextLabel.textColor = Resourses.Colors.primaryText

		valueDescTextLabel.font = Resourses.Fonts.secondaryBoldText
		valueDescTextLabel.textColor = Resourses.Colors.secondaryText
	}
}

extension StageTextLine: StageTextLineViewInput {
	func update(
		info: String,
		value: String,
		valueDesc: String
	) {
		infoTextLabel.text = info
		valueTextLabel.text = value
		valueDescTextLabel.text = valueDesc
	}
}
