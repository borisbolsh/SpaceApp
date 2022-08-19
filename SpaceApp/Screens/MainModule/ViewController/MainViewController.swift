import UIKit

final class MainViewController: UIViewController {
	private let output: MainViewOutput

	private let scrollView = UIScrollView()
	private let contentView = UIView()
	private let imageRocket = UIImageView()
	private let testView = UIView()

	init(output: MainViewOutput) {
		self.output = output
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		view.backgroundColor = .white
		output.viewDidLoad()
		setupSubviews()
	}
}

// MARK: Private

extension MainViewController {
	private func setupSubviews() {
		view.addSubview(scrollView)
		scrollView.addSubview(contentView)
		contentView.addSubview(imageRocket)
		contentView.addSubview(testView)

		setupUI()
		configurateUI()
	}

	private func setupUI() {
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		contentView.translatesAutoresizingMaskIntoConstraints = false
		imageRocket.translatesAutoresizingMaskIntoConstraints = false
		testView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate ([
			scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
			scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
			scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),

			contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
			contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
			contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

			imageRocket.topAnchor.constraint(equalTo: contentView.topAnchor),
			imageRocket.leftAnchor.constraint(equalTo: contentView.leftAnchor),
			imageRocket.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			imageRocket.heightAnchor.constraint(equalToConstant: 150),
			imageRocket.widthAnchor.constraint(equalTo: contentView.widthAnchor),

			testView.topAnchor.constraint(equalTo: imageRocket.bottomAnchor),
			testView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
			testView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			testView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			testView.heightAnchor.constraint(equalToConstant: 550),
		])
	}

	private func configurateUI() {
		contentView.backgroundColor = .black
		testView.backgroundColor = .yellow
	}
}

// MARK: View input

extension MainViewController: MainViewInput {
	func set(viewModels: [RocketViewModel]) {
//		self.viewModels = viewModels
//		self.collectionView.reloadData()
	}
}

