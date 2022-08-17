import UIKit

final class MainViewController: UIViewController {
	private let output: MainViewOutput

	private let scrollView = UIScrollView()

	init(output: MainViewOutput) {
		self.output = output
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
//		view.backgroundColor = .red
		output.viewDidLoad()
		setupSubviews()
	}
}

// MARK: Private

extension MainViewController {
	private func setupSubviews() {
		
	}
}

// MARK: View input

extension MainViewController: MainViewInput {
	func set(viewModels: [RocketViewModel]) {
//		self.viewModels = viewModels
//		self.collectionView.reloadData()
	}
}

