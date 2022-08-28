import UIKit

protocol ButtonLaunchesBlockRocketViewInput {
	func setup(
		textButton: String,
		idRocket: String,
		nameRocket: String,
		output: ButtonLaunchesBlockRocketViewOutput?
	)
}

protocol ButtonLaunchesBlockRocketViewOutput: AnyObject {
	func didTapOnShowLaunches(idRocket: String, nameRocket: String)
}

final class ButtonLaunchesBlockRocket: UIView {
	private enum Constants {
		enum ButtonLaunches {
			static let cornerRadiusBottom: CGFloat = 16
		}
	}

	private weak var output: ButtonLaunchesBlockRocketViewOutput?
	private let launchesButton = UIButton()
	private var idRocket: String?
	private var nameRocket: String?

	init() {
		super.init(frame: .zero)

		setupUI()
		configureUI()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}

extension ButtonLaunchesBlockRocket {
	private func setupUI() {
		self.addSubview(launchesButton)
		launchesButton.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate ([
			launchesButton.topAnchor.constraint(equalTo: self.topAnchor),
			launchesButton.leftAnchor.constraint(equalTo: self.leftAnchor),
			launchesButton.rightAnchor.constraint(equalTo: self.rightAnchor),
			launchesButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
		])
	}

	private func configureUI() {
		self.backgroundColor = .clear
		launchesButton.backgroundColor = Resourses.Colors.buttonBackground
		launchesButton.titleLabel?.font = Resourses.Fonts.secondaryBoldText
		launchesButton.layer.cornerRadius = Constants.ButtonLaunches.cornerRadiusBottom
		launchesButton.addTarget(self, action: #selector(didTapOnLaunchesBtn), for: .touchUpInside)
	}
}

// MARK: Button View Input

extension ButtonLaunchesBlockRocket: ButtonLaunchesBlockRocketViewInput {
	func setup(
		textButton: String,
		idRocket: String,
		nameRocket: String,
		output: ButtonLaunchesBlockRocketViewOutput?) {
			launchesButton.setTitle(textButton, for: .normal)
			self.output = output
			self.idRocket = idRocket
			self.nameRocket = nameRocket
	}
}

// MARK: Actions

extension ButtonLaunchesBlockRocket {
	@objc func didTapOnLaunchesBtn() {
		guard
			let idRocket = idRocket,
			let nameRocket = nameRocket
		else {
			return
		}
		output?.didTapOnShowLaunches(idRocket: idRocket, nameRocket: nameRocket)
	}
}
