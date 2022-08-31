import UIKit

protocol SettingsSegmentedControlDelegate: AnyObject {
	func changeUserSettings(itemType: SettingsItemType, toActiveItem: String)
}

protocol SettingsSegmentedControlInput {
	func configure(model: SettingsViewModel)
}

final class SettingsSegmentedControl: UIView {
	private enum Constants {
		static let cornerRadius: CGFloat = 8
	}

	weak var delegate: SettingsSegmentedControlDelegate?
	private var viewModel: SettingsViewModel?

	private var buttonTitles = [String]()
	private var buttons = [UIButton]()
	private var selectorView = UIView()

	private var textColor: UIColor = Resourses.Colors.secondaryText
	private var selectorViewColor: UIColor = .white
	private var selectorTextColor: UIColor = .black

	private var selectedIndex: Int = 0

	init() {
		super.init(frame: .zero)
		self.buttonTitles =  ["on", "off"]

		configurateUI()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func draw(_ rect: CGRect) {
		super.draw(rect)
		self.backgroundColor = .white
		updateView()
	}

	@objc func buttonAction(sender: UIButton) {
		guard let viewModel = viewModel else {
			return
		}
		for (buttonIndex, btn) in buttons.enumerated() {
			btn.setTitleColor(textColor, for: .normal)
			if btn == sender {
				let selectorPosition = frame.width / CGFloat(buttonTitles.count) * CGFloat(buttonIndex)
				selectedIndex = buttonIndex
				delegate?.changeUserSettings(itemType: viewModel.itemType, toActiveItem: btn.titleLabel?.text ?? "")
				UIView.animate(withDuration: 0.3) {
					self.selectorView.frame.origin.x = selectorPosition + 3
				}
				btn.setTitleColor(selectorTextColor, for: .normal)
			}
		}
	}
}

// Configuration View

extension SettingsSegmentedControl {
	private func updateView() {
		createButton()
		configSelectorView()
		configStackView()
	}

	private func configStackView() {
		let stack = UIStackView(arrangedSubviews: buttons)
		stack.axis = .horizontal
		stack.alignment = .fill
		stack.distribution = .fillEqually
		addSubview(stack)

		stack.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			stack.topAnchor.constraint(equalTo: self.topAnchor),
			stack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			stack.leftAnchor.constraint(equalTo: self.leftAnchor),
			stack.rightAnchor.constraint(equalTo: self.rightAnchor)
		])
	}

	private func configSelectorView() {
		let selectorWidth = frame.width / CGFloat(self.buttonTitles.count) - 3 * 2
		let selectorPosition = frame.width / CGFloat(buttonTitles.count) * CGFloat(selectedIndex)
		let height = self.frame.height - 3 * 2
		selectorView = UIView(frame: CGRect(x: selectorPosition + 3,
																				y: 3,
																				width: selectorWidth,
																				height: height))

		selectorView.backgroundColor = selectorViewColor
		selectorView.layer.cornerRadius = Constants.cornerRadius
		addSubview(selectorView)
	}

	private func createButton() {
		buttons = [UIButton]()
		buttons.removeAll()
		subviews.forEach({$0.removeFromSuperview()})
		for buttonTitle in buttonTitles {
			let button = UIButton(type: .system)
			button.setTitle(buttonTitle, for: .normal)
			button.addTarget(self, action: #selector(SettingsSegmentedControl.buttonAction(sender:)), for: .touchUpInside)
			button.setTitleColor(textColor, for: .normal)
			buttons.append(button)
		}
		buttons[selectedIndex].setTitleColor(selectorTextColor, for: .normal)
	}

	private func configurateUI() {
		self.backgroundColor = Resourses.Colors.buttonBackground
		self.layer.cornerRadius = Constants.cornerRadius
		self.layer.masksToBounds = true
	}
}

extension SettingsSegmentedControl: SettingsSegmentedControlInput {
	func configure(model: SettingsViewModel) {
		self.viewModel = model
		buttonTitles = [model.firstStat, model.secondStat]
		selectedIndex = model.activeItem == model.firstStat ? 0 : 1
	}
}
