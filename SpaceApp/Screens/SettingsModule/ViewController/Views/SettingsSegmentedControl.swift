import UIKit

protocol SettingsSegmentedControlDelegate: AnyObject {
	func change(toIndex: Int, btnText: String)
}

protocol SettingsSegmentedControlInput {
	func updateBtnsTitles(firstBtnTitle: String,
												secondBtnTitle: String,
												activeItem: Int)
}

final class SettingsSegmentedControl: UIView {
	private enum Constants {

	}

	weak var delegate: SettingsSegmentedControlDelegate?

	private var buttonTitles = [String]()
	private var buttons = [UIButton]()
	private var selectorView = UIView()

	private var textColor: UIColor = Resourses.Colors.secondaryText
	private var selectorViewColor: UIColor = .white
	private var selectorTextColor: UIColor = .black

	public private(set) var selectedIndex: Int = 0

	init(buttonTitle: [String] = ["on", "off"]) {
		super.init(frame: CGRect(x: 0, y: 0, width: 150, height: 48))
		self.buttonTitles = buttonTitle
		self.backgroundColor = Resourses.Colors.buttonBackground
		self.layer.cornerRadius = 8
		self.layer.masksToBounds = true
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func draw(_ rect: CGRect) {
		super.draw(rect)
		self.backgroundColor = .white
		updateView()
	}

	func setIndex(index: Int) {
		buttons.forEach({ $0.setTitleColor(textColor, for: .normal) })
		let button = buttons[index]
		selectedIndex = index
		button.setTitleColor(selectorTextColor, for: .normal)
		let selectorPosition = frame.width / CGFloat(buttonTitles.count) * CGFloat(index)
		UIView.animate(withDuration: 0.2) {
			self.selectorView.frame.origin.x = selectorPosition + 3
		}
	}

	@objc func buttonAction(sender: UIButton) {
		for (buttonIndex, btn) in buttons.enumerated() {
			btn.setTitleColor(textColor, for: .normal)
			if btn == sender {
				let selectorPosition = frame.width / CGFloat(buttonTitles.count) * CGFloat(buttonIndex)
				selectedIndex = buttonIndex
				delegate?.change(toIndex: selectedIndex, btnText: btn.titleLabel?.text ?? "")
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
		stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
		stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
		stack.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
		stack.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
	}

	private func configSelectorView() {
		let selectorWidth = frame.width / CGFloat(self.buttonTitles.count) - 3 * 2
		let height = self.frame.height - 3 * 2
		selectorView = UIView(frame: CGRect(x: 3,
																				y: 3,
																				width: selectorWidth,
																				height: height))
		selectorView.backgroundColor = selectorViewColor
		selectorView.layer.cornerRadius = 8
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
		buttons[0].setTitleColor(selectorTextColor, for: .normal)
	}
}

extension SettingsSegmentedControl: SettingsSegmentedControlInput {
	func updateBtnsTitles(firstBtnTitle: String,
												secondBtnTitle: String,
												activeItem: Int) {
		buttonTitles = [firstBtnTitle, secondBtnTitle]
		createButton()
		setIndex(index: activeItem)
	}
}
