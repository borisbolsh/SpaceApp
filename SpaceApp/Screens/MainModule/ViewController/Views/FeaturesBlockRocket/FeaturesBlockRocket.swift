import UIKit

protocol FeaturesBlockRocketViewInput {
	func setup(viewModels: [FeatureViewModel]?)
}

final class FeaturesBlockRocket: UIView {
	private enum Constants {
		enum FeaturesStackView {
			static let insetItems: CGFloat = 12
			static let insetLeftRight: CGFloat = 32
			static let insetTopBottom: CGFloat = 12
		}
	}

	@IBOutlet private var scrollView: UIScrollView!
	private let contentView = UIView()

	private var viewModels: [FeatureViewModel]?
	private var featureItems = [FeatureItem]()
	private var stackView = UIStackView()

	override func awakeFromNib() {
		super.awakeFromNib()

		setupUI()
		configureUI()
	}
}

extension FeaturesBlockRocket {
	private func setupUI() {
		scrollView.addSubview(contentView)
		contentView.addSubview(stackView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		contentView.translatesAutoresizingMaskIntoConstraints = false
		stackView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate ([
			contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
			contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
			contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),

			stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
			stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
			stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
		])
	}

	private func configureUI() {
		self.backgroundColor = .clear
		contentView.backgroundColor = .clear

		stackView.alignment = .center
		stackView.axis = .horizontal
		stackView.spacing = Constants.FeaturesStackView.insetItems
		stackView.layoutMargins = UIEdgeInsets(
			top: Constants.FeaturesStackView.insetTopBottom,
			left: Constants.FeaturesStackView.insetLeftRight,
			bottom: Constants.FeaturesStackView.insetTopBottom,
			right: Constants.FeaturesStackView.insetLeftRight
		)
		stackView.isLayoutMarginsRelativeArrangement = true
	}

	private func updateUI(){
		guard let viewModels = viewModels else {
			return
		}

		stackView.removeFullyAllArrangedSubviews()

		viewModels.forEach { item in
			let newItem = FeatureItem()
			newItem.update(title: item.title, subtitle: item.subtitle)

			newItem.translatesAutoresizingMaskIntoConstraints = false
			stackView.addArrangedSubview(newItem)
		}

		layoutIfNeeded()
	}
}

extension FeaturesBlockRocket: FeaturesBlockRocketViewInput {
	func setup(viewModels: [FeatureViewModel]?) {
		self.viewModels = viewModels
		updateUI()
	}
}
