import UIKit

final class StageTextLine: UIView {
	@IBOutlet private var infoTextLabel: UILabel!
	@IBOutlet private var valueTextLabel: UILabel!
	@IBOutlet var valueDescTextLabel: UILabel!


	func update(model: String) {
//		startInterfaceConfiguration()
//		detailLabel.text = model.detail
//		titleLabel.text = model.title
		configureUI()
	}
}

extension StageTextLine {
	private func configureUI() {
		infoTextLabel.text = Resourses.Fonts.primaryText

		valueTextLabel.text = Resourses.Fonts.primaryText

		valueDescTextLabel.text = Resourses.Fonts.secondaryBoldText
	}
}
