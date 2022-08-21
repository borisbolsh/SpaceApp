import UIKit

protocol ButtonLaunchesBlockRocketViewInput {
	func setup(
		textButton: String,
		idRocket: String,
		output: ButtonLaunchesBlockRocketViewOutput?
	)
}

protocol ButtonLaunchesBlockRocketViewOutput: AnyObject {
	func didTapOnShowLaunches(idRocket: String)
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

		launchesButton.layer.cornerRadius = Constants.ButtonLaunches.cornerRadiusBottom
		launchesButton.addTarget(self, action: #selector(didTapOnLaunchesBtn), for: .touchUpInside)
	}
}

// MARK: Button View Input

extension ButtonLaunchesBlockRocket: ButtonLaunchesBlockRocketViewInput {
	func setup(
		textButton: String,
		idRocket: String,
		output: ButtonLaunchesBlockRocketViewOutput?) {
			launchesButton.setTitle(textButton, for: .normal)
			self.output = output
			self.idRocket = idRocket
	}
}

// MARK: Actions

extension ButtonLaunchesBlockRocket {
	@objc func didTapOnLaunchesBtn() {
		guard let idRocket = idRocket else {
			return
		}
		output?.didTapOnShowLaunches(idRocket: idRocket)
	}
}
