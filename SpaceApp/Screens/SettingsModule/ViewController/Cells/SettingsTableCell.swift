import UIKit

protocol SettingsTableCellInput {
	func configure(
		model: SettingsViewModel,
		output: SettingsTableCellOutput?
	)
}

protocol SettingsTableCellOutput: AnyObject {
	func didTapOnSegmentedControl()
}

final class SettingsTableCell: UITableViewCell {
	private enum Constants {
		enum TitleLabel {
			static let leftInset: CGFloat = 28
			static let rightInset: CGFloat = -16
		}

		enum SegmentedControl {
			static let width: CGFloat = 120
			static let height: CGFloat = 40
			static let insetTop: CGFloat = 12
			static let insetBottom: CGFloat = -12
			static let insetRight: CGFloat = -28
		}
	}

	weak var output: SettingsTableCellOutput?
	private var model: SettingsViewModel?

	private let titleLabel = UILabel()
	private let segmentedControl = SettingsSegmentedControl()

	override init(style: CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupUI()
		configureUI()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupUI()
		configureUI()
	}

	private func setupUI() {
		contentView.addSubview(titleLabel)
		contentView.addSubview(segmentedControl)

		setupConstraints()
	}

	private func setupConstraints() {
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		segmentedControl.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate ([
			titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.TitleLabel.leftInset),
			titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			titleLabel.rightAnchor.constraint(greaterThanOrEqualTo: segmentedControl.leftAnchor, constant: Constants.TitleLabel.rightInset),

			segmentedControl.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Constants.SegmentedControl.insetRight),
			segmentedControl.widthAnchor.constraint(equalToConstant: Constants.SegmentedControl.width),
			segmentedControl.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.SegmentedControl.height),
			segmentedControl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.SegmentedControl.insetTop),
			segmentedControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.SegmentedControl.insetBottom),
		])
	}

	private func configureUI() {
		self.backgroundColor = .clear
		contentView.backgroundColor = .clear
		titleLabel.textColor = Resourses.Colors.lightText
	}

	private func updateUI() {
		guard let model = model,
					let output = output
		else {
			return
		}

		titleLabel.text = model.titleItem

		if let output = output as? SettingsSegmentedControlDelegate {
			segmentedControl.delegate = output
		}
		segmentedControl.configure(model: model)
	}
}

extension SettingsTableCell: SettingsTableCellInput {
	func configure(
		model: SettingsViewModel,
		output: SettingsTableCellOutput?
	){
		guard let output = output else {
			return
		}
		self.model = model
		self.output = output
		updateUI()
	}
}
