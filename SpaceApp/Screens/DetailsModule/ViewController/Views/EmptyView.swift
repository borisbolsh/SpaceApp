import UIKit

protocol EmptyViewInput {
	func update(title: String, subtitle: String)
}

struct EmptyViewViewModel {
	let title: String
	let subtitle: String
}

final class EmptyView: UIView {
	private enum Constants {
		static let heightItemView: CGFloat = 180
		static let widthItemView: CGFloat = 320

		enum Icon {
			static let topInset: CGFloat = 20
			static let height: CGFloat = 64
			static let width: CGFloat = 64
		}

		enum Title {
			static let topInset: CGFloat = 20
			static let leftInset: CGFloat = 16
			static let rightInset: CGFloat = -16
		}

		enum Subtitle {
			static let topInset: CGFloat = 20
			static let leftInset: CGFloat = 16
			static let rightInset: CGFloat = -16
			static let bottomInset: CGFloat = -16
		}
	}

	private let iconImage = UIImageView()
	private let titleLabel = UILabel()
	private let subtitleLabel = UILabel()

	init() {
		super.init(
			frame: CGRect(
				x: .zero,
				y: .zero,
				width: Constants.widthItemView,
				height: Constants.heightItemView
			)
		)

		setupUI()
		configureUI()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}

extension EmptyView {
	private func setupUI() {
		addSubview(iconImage)
		addSubview(titleLabel)
		addSubview(subtitleLabel)

		iconImage.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		subtitleLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate ([
			iconImage.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: Constants.Icon.topInset),
			iconImage.widthAnchor.constraint(equalToConstant: Constants.Icon.width),
			iconImage.heightAnchor.constraint(equalToConstant: Constants.Icon.height),
			iconImage.centerXAnchor.constraint(equalTo: centerXAnchor),

			titleLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: Constants.Title.topInset),
			titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.Title.leftInset),
			titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: Constants.Title.rightInset),

			subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.Subtitle.topInset),
			subtitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.Subtitle.leftInset),
			subtitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: Constants.Subtitle.rightInset),
			subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.Subtitle.bottomInset)
		])
	}

	private func configureUI() {
		let image = Resourses.Images.rocket?.withRenderingMode(.alwaysTemplate)
		iconImage.tintColor = .white.withAlphaComponent(0.7)
		iconImage.image = image

		titleLabel.font = Resourses.Fonts.secondaryBoldText
		titleLabel.textColor = Resourses.Colors.primaryText
		titleLabel.textAlignment = .center

		subtitleLabel.font = Resourses.Fonts.secondaryInfoText
		subtitleLabel.textColor = Resourses.Colors.secondaryText
		subtitleLabel.textAlignment = .center
	}
}

extension EmptyView: EmptyViewInput {
	func update(
		title: String,
		subtitle: String
	) {
		titleLabel.text = title
		subtitleLabel.text = subtitle
	}
}
