import UIKit

final class StageTextLine: UIView {
	@IBOutlet private var infoTextLabel: UILabel!
	@IBOutlet private var valueTextLabel: UILabel!
	@IBOutlet var valueDescTextLabel: UILabel!

	override func awakeFromNib() {
			super.awakeFromNib()
	}
	
	func update(model: String) {
//		startInterfaceConfiguration()
//		detailLabel.text = model.detail
//		titleLabel.text = model.title
		configureUI()
	}
}

extension StageTextLine {
	private func configureUI() {
		infoTextLabel.font = Resourses.Fonts.primaryText

		valueTextLabel.font = Resourses.Fonts.primaryText

		valueDescTextLabel.font = Resourses.Fonts.secondaryBoldText
	}
}
