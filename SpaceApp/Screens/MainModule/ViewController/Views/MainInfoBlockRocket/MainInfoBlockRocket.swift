import UIKit

protocol MainInfoBlockRocketViewInput {
	func update(viewModels: [MainInfoViewModel]?)
}

final class MainInfoBlockRocket: UIView {
	private enum Constants {
		enum MainInfoStackView {
			static let insetItems: CGFloat = 6
			static let insetLeftRight: CGFloat = 32
			static let insetTopBottom: CGFloat = 16
		}
	}

	private let contentView = UIView()
	private var stackView = UIStackView()

	private var viewModels: [MainInfoViewModel]?

	init() {
		super.init(frame: .zero)

		setupUI()
		configureUI()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}

extension MainInfoBlockRocket {
	private func setupUI() {
		self.addSubview(contentView)
		contentView.addSubview(stackView)
		contentView.translatesAutoresizingMaskIntoConstraints = false
		stackView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate ([
			contentView.topAnchor.constraint(equalTo: self.topAnchor),
			contentView.leftAnchor.constraint(equalTo: self.leftAnchor),
			contentView.rightAnchor.constraint(equalTo: self.rightAnchor),
			contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

			stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
			stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
			stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			])
	}

	private func configureUI() {
		self.backgroundColor = .clear
		contentView.backgroundColor = .clear

		stackView.axis = .vertical
		stackView.distribution = .fillEqually
		stackView.spacing = Constants.MainInfoStackView.insetItems
		stackView.layoutMargins = UIEdgeInsets(
			top: Constants.MainInfoStackView.insetTopBottom,
			left: Constants.MainInfoStackView.insetLeftRight,
			bottom: Constants.MainInfoStackView.insetTopBottom,
			right: Constants.MainInfoStackView.insetLeftRight
		)
		stackView.isLayoutMarginsRelativeArrangement = true
	}

	private func updateUI() {
		guard let viewModels = viewModels else {
			return
		}

		viewModels.forEach { item in
			let newItem = InfoTextLine.loadFromNib()
			newItem.update(title: item.info, value: item.value)
			stackView.addArrangedSubview(newItem)
		}

		layoutIfNeeded()
	}
}

extension MainInfoBlockRocket: MainInfoBlockRocketViewInput {
	func update(viewModels: [MainInfoViewModel]?){
		self.viewModels = viewModels
		updateUI()
	}
}
