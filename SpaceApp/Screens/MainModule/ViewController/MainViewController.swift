import UIKit

final class MainViewController: UIViewController {
	private let output: MainViewOutput

	init(output: MainViewOutput) {
		self.output = output
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		view.backgroundColor = .red
		output.viewDidLoad()
	}
}

extension MainViewController: MainViewInput {}
