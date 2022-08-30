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
//		enum LaunchView {
//			static let heightItem: CGFloat = 100
//			static let insetTop: CGFloat = 8
//			static let insetBottom: CGFloat = -8
//			static let insetLeft: CGFloat = 32
//			static let insetRight: CGFloat = -32
//			static let cornerRadius: CGFloat = 20
//		}
	}

	weak var output: SettingsTableCellOutput?
	private var model: SettingsViewModel?

	private let titleLabel = UILabel()
	private let segmentedControl = SettingsSegmentedControl(width: 120, height: 40)

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
			titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 28),
			titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			titleLabel.rightAnchor.constraint(greaterThanOrEqualTo: segmentedControl.leftAnchor, constant: 16),

			segmentedControl.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -28),
			segmentedControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			segmentedControl.widthAnchor.constraint(equalToConstant: 120),
			segmentedControl.heightAnchor.constraint(equalToConstant: 40),
			segmentedControl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
			segmentedControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
		])
	}

	private func configureUI() {
		self.backgroundColor = .clear
		contentView.backgroundColor = .clear
//		segmentedControl.backgroundColor = .clear

//		launchView.backgroundColor = Resourses.Colors.secondaryBackground
//
//		launchView.layer.cornerRadius = Constants.LaunchView.cornerRadius
//
//		titleLabel.font = Resourses.Fonts.detailsLaunchesTitle
		titleLabel.textColor = Resourses.Colors.lightText
//		dateLabel.textColor = Resourses.Colors.secondaryText
	}

	private func updateUI() {
		guard
			let model = model,
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
