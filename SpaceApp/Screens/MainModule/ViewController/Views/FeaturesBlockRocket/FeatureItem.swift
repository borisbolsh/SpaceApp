import UIKit

protocol FeatureItemViewInput {
	func update(title: String, subtitle: String)
}

final class FeatureItem: UIView {
	private enum Constants {
		static let heightItemView: CGFloat = 96
		static let widthItemView: CGFloat = 96
		static let cornerRadiusItemView: CGFloat = 24
	}

	private let itemView = UIView()
	private let centerView = UIView()
	private let headerItem = UILabel()
	private let subtitleItem = UILabel()

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

extension FeatureItem {
	private func setupUI() {
		self.addSubview(itemView)
		itemView.addSubview(centerView)
		centerView.addSubview(headerItem)
		centerView.addSubview(subtitleItem)

		itemView.translatesAutoresizingMaskIntoConstraints = false
		centerView.translatesAutoresizingMaskIntoConstraints = false
		headerItem.translatesAutoresizingMaskIntoConstraints = false
		subtitleItem.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate ([
			itemView.topAnchor.constraint(equalTo: topAnchor),
			itemView.leftAnchor.constraint(equalTo: leftAnchor),
			itemView.rightAnchor.constraint(equalTo: rightAnchor),
			itemView.bottomAnchor.constraint(equalTo: bottomAnchor),
			itemView.widthAnchor.constraint(equalToConstant: Constants.widthItemView),
			itemView.heightAnchor.constraint(equalToConstant: Constants.heightItemView),

			centerView.centerXAnchor.constraint(equalTo: itemView.centerXAnchor),
			centerView.centerYAnchor.constraint(equalTo: itemView.centerYAnchor),

			headerItem.topAnchor.constraint(equalTo: centerView.topAnchor),
			headerItem.leadingAnchor.constraint(equalTo: centerView.leadingAnchor),
			headerItem.trailingAnchor.constraint(equalTo: centerView.trailingAnchor),

			subtitleItem.topAnchor.constraint(equalTo: headerItem.bottomAnchor),
			subtitleItem.leadingAnchor.constraint(equalTo: centerView.leadingAnchor),
			subtitleItem.trailingAnchor.constraint(equalTo: centerView.trailingAnchor),
			subtitleItem.bottomAnchor.constraint(equalTo: centerView.bottomAnchor)
		])
	}

	private func configureUI() {
		itemView.backgroundColor = Resourses.Colors.secondaryBackground
		itemView.layer.cornerRadius = Constants.cornerRadiusItemView

		centerView.backgroundColor = .clear

		headerItem.font = Resourses.Fonts.secondaryBoldText
		headerItem.textColor = Resourses.Colors.primaryText
		headerItem.textAlignment = .center

		subtitleItem.font = Resourses.Fonts.secondaryInfoText
		subtitleItem.textColor = Resourses.Colors.secondaryText
		subtitleItem.textAlignment = .center
	}
}

extension FeatureItem: FeatureItemViewInput {
	func update(
		title: String,
		subtitle: String
	) {
		headerItem.text = title
		subtitleItem.text = subtitle

		layoutIfNeeded()
	}
}
