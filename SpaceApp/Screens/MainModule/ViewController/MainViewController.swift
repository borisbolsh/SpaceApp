import UIKit

final class MainViewController: UIViewController {
	private let output: MainViewOutput

	private let collectionView: UICollectionView

	init(output: MainViewOutput) {
		self.output = output
		let collectionViewLayout = UICollectionViewFlowLayout()
		self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
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

extension MainViewController: MainViewInput {
	func set(viewModels: [RocketViewModel]) {
		self.viewModels = viewModels
		self.collectionView.reloadData()
	}
}
