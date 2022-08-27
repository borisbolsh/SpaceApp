import UIKit

protocol DetailsLaunchesCellViewInput {
	func configure(model: LaunchViewModel)
}

final class DetailsLaunchesCell: UITableViewCell {
	private enum Constants {
		enum LaunchView {
			static let heightItem: CGFloat = 100
			static let insetTop: CGFloat = 8
			static let insetBottom: CGFloat = -8
			static let insetLeft: CGFloat = 32
			static let insetRight: CGFloat = -32
			static let cornerRadius: CGFloat = 20
		}

		enum TitleLabel {
			static let insetTop: CGFloat = 24
			static let insetLeft: CGFloat = 24
			static let height: CGFloat = 24
		}

		enum DateLabel {
			static let insetLeft: CGFloat = 24
			static let insetBottom: CGFloat = -20
		}

		enum StatusImageView {
			static let insetRight: CGFloat = -24
			static let height: CGFloat = 32
			static let width: CGFloat = 32
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

			titleLabel.topAnchor.constraint(equalTo: launchView.topAnchor, constant: Constants.TitleLabel.insetTop),
			titleLabel.leftAnchor.constraint(equalTo: launchView.leftAnchor, constant: Constants.TitleLabel.insetLeft),
			titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.TitleLabel.height),

			dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
			dateLabel.leftAnchor.constraint(equalTo: launchView.leftAnchor, constant: Constants.DateLabel.insetLeft),
			dateLabel.bottomAnchor.constraint(equalTo: launchView.bottomAnchor, constant: Constants.DateLabel.insetBottom),

			statusImageView.centerYAnchor.constraint(equalTo: launchView.centerYAnchor),
			statusImageView.rightAnchor.constraint(equalTo: launchView.rightAnchor, constant: Constants.StatusImageView.insetRight),
			statusImageView.widthAnchor.constraint(equalToConstant: Constants.StatusImageView.width),
			statusImageView.heightAnchor.constraint(equalToConstant: Constants.StatusImageView.height),
		])
	}

	private func configureUI() {
		self.backgroundColor = .clear
		contentView.backgroundColor = .clear
		launchView.backgroundColor = Resourses.Colors.secondaryBackground

		launchView.layer.cornerRadius = Constants.LaunchView.cornerRadius

		titleLabel.font = Resourses.Fonts.detailsLaunchesTitle
		titleLabel.textColor = Resourses.Colors.lightText
		dateLabel.textColor = Resourses.Colors.secondaryText
	}
}

extension DetailsLaunchesCell: DetailsLaunchesCellViewInput {
	func configure(model: LaunchViewModel) {
		titleLabel.text = model.nameLaunch
		let date = Date(timeIntervalSince1970: model.dateLaunch)

		dateLabel.text = DateFormatter.launchDateTimeFormatter.string(from: date)
		statusImageView.image = model.isSuccess ? Resourses.Images.launchOk : Resourses.Images.launchCencel
	}
}
