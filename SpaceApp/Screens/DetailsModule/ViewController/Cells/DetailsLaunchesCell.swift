import UIKit

protocol DetailsLaunchesCellViewInput {
//	func configure(model: )
}

final class DetailsLaunchesCell: UITableViewCell {
	private enum Constants {
		enum LaunchView {
			static let heightItem: CGFloat = 150
			static let insetTop: CGFloat = 8
			static let insetBottom: CGFloat = -8
			static let insetLeft: CGFloat = 32
			static let insetRight: CGFloat = -32
		}
	}

	private let launchView = UIView()
	private let titleLabel = UILabel()
	private let dateLabel = UILabel()
	private let statusImageView = UIImageView()

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
		contentView.addSubview(launchView)
		launchView.addSubview(titleLabel)
		launchView.addSubview(dateLabel)
		launchView.addSubview(statusImageView)

		setupConstraints()
	}

	private func setupConstraints() {
		launchView.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		dateLabel.translatesAutoresizingMaskIntoConstraints = false
		statusImageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate ([
			launchView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.LaunchView.insetBottom),
			launchView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.LaunchView.insetLeft),
			launchView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Constants.LaunchView.insetRight),
			launchView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.LaunchView.insetTop),
			launchView.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.LaunchView.heightItem),

			titleLabel.topAnchor.constraint(equalTo: launchView.topAnchor, constant: 24),
			titleLabel.leftAnchor.constraint(equalTo: launchView.leftAnchor, constant: 24),

			dateLabel.topAnchor.constraint(equalTo: launchView.bottomAnchor),
			dateLabel.leftAnchor.constraint(equalTo: launchView.leftAnchor, constant: 24),
			dateLabel.bottomAnchor.constraint(equalTo: launchView.bottomAnchor, constant: -24),

			statusImageView.centerXAnchor.constraint(equalTo: launchView.centerXAnchor),
			statusImageView.rightAnchor.constraint(equalTo: launchView.rightAnchor, constant: -24)

		])
	}

	private func configureUI() {
		self.backgroundColor = .clear
		contentView.backgroundColor = .clear
		launchView.backgroundColor = Resourses.Colors.secondaryBackground

		launchView.layer.cornerRadius = 20
	}
}

extension DetailsLaunchesCellViewInput {

}
