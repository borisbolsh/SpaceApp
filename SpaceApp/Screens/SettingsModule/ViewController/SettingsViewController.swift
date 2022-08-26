import UIKit

final class SettingsViewController: UIViewController {
	private let output: SettingsViewOutput

	init(output: SettingsViewOutput) {
		self.output = output
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		output.viewDidLoad()
	}
}

// MARK: View input

extension SettingsViewController: SettingsViewInput {
	func set(title: String) {
		self.title = title
	}
}
