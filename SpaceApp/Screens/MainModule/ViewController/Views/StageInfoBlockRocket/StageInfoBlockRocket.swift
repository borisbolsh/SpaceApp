import UIKit

protocol StageInfoBlockRocketViewInput {
	func update(viewModel: StageInfoViewModel?)
}

final class StageInfoBlockRocket: UIView {
	private enum Constants {
		enum Title {
			static let topInset: CGFloat = 12
			static let height: CGFloat = 32
		}

		enum StageInfoStackView {
			static let insetItems: CGFloat = 0
			static let insetLeftRight: CGFloat = 0
			static let insetTopBottom: CGFloat = 12
		}
	}

	private let titleLabel = UILabel()
	private let contentView = UIView()
	private var stackView = UIStackView()

	private var viewModels: [StageInfoItemViewModel]?

	init() {
		super.init(frame: .zero)

		setupUI()
		configureUI()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}

extension StageInfoBlockRocket {
	private func setupUI() {
		self.addSubview(contentView)
		contentView.addSubview(titleLabel)
		contentView.addSubview(stackView)
		contentView.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		stackView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate ([
			contentView.topAnchor.constraint(equalTo: self.topAnchor),
			contentView.leftAnchor.constraint(equalTo: self.leftAnchor),
			contentView.rightAnchor.constraint(equalTo: self.rightAnchor),
			contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

			titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Title.topInset),
			titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			titleLabel.heightAnchor.constraint(equalToConstant: Constants.Title.height),

			stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
			stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
			stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
		])
	}

	private func configureUI() {
		self.backgroundColor = .clear
		contentView.backgroundColor = .clear

		titleLabel.font = Resourses.Fonts.secondaryBoldText
		titleLabel.textColor = Resourses.Colors.primaryText

		stackView.axis = .vertical
		stackView.distribution = .fillEqually
		stackView.spacing = Constants.StageInfoStackView.insetItems
		stackView.layoutMargins = UIEdgeInsets(
			top: Constants.StageInfoStackView.insetTopBottom,
			left: Constants.StageInfoStackView.insetLeftRight,
			bottom: Constants.StageInfoStackView.insetTopBottom,
			right: Constants.StageInfoStackView.insetLeftRight
		)
		stackView.isLayoutMarginsRelativeArrangement = true
	}

	private func updateUI() {
		guard let viewModels = viewModels else {
			return
		}

		viewModels.forEach { item in
			let newItem = StageTextLine.loadFromNib()

			newItem.update(
				info: item.titleItem,
				value: item.valueItem ?? "",
				valueDesc: item.valueDescItem ?? ""
			)

			stackView.addArrangedSubview(newItem)
		}

		layoutIfNeeded()
	}
}

extension StageInfoBlockRocket: StageInfoBlockRocketViewInput {
	func update(viewModel: StageInfoViewModel?) {
		guard let viewModel = viewModel else {
			return
		}

		titleLabel.text = viewModel.headingStage.uppercased()
		viewModels = viewModel.stageViewModels

		updateUI()
	}
}

