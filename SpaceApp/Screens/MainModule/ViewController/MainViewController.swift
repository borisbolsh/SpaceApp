import UIKit
import Kingfisher

final class MainViewController: UIViewController {
	private enum Constants {
		enum PlaceholderImage {
			static let height: CGFloat = 80
			static let width: CGFloat = 80
		}

		enum ContentBlockView {
			static let insetLeft: CGFloat = 32
			static let insetRight: CGFloat = -32
		}
	}

	private let output: MainViewOutput

	private let scrollView = UIScrollView()
	private let contentView = UIView()
	private let imageRocket = UIImageView()
	private let contentBlockView = UIView()
	private let contentTopBlockView = UIView()
	private let testBtn = UIButton()
	private let placeholderImage = UIImageView()
	private var heightConstraint: NSLayoutConstraint?

	private var imageHeight: CGFloat = 150
	private var imageHeightRocketConstraint: NSLayoutConstraint?
	private var isFirstLoading = true

	private var viewModels = [RocketViewModel]()

	private lazy var titleBlock = HeadingBlockRocket.loadFromNib()

	init(output: MainViewOutput) {
		self.output = output
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		navigationController?.setNavigationBarHidden(true, animated: false)

		output.viewDidLoad()
		setupSubviews()
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.setNavigationBarHidden(false, animated: animated)
	}

	override func viewDidLayoutSubviews() {
		if isFirstLoading {
			imageHeight = view.layer.frame.height / 2
			imageHeightRocketConstraint?.isActive = false
			imageHeightRocketConstraint =
						imageRocket.heightAnchor.constraint(equalToConstant: imageHeight)
			imageHeightRocketConstraint?.isActive = true

			isFirstLoading = false
		}
	}

	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
}

// MARK: Private

extension MainViewController {
	private func setupSubviews() {
		view.addSubview(scrollView)
		scrollView.addSubview(contentView)
		contentView.addSubview(imageRocket)
		imageRocket.addSubview(contentTopBlockView)
		imageRocket.addSubview(placeholderImage)
		contentView.addSubview(contentBlockView)
		contentBlockView.addSubview(testBtn)
		contentBlockView.addSubview(titleBlock)

		setupUI()
		configurateUI()
	}

	private func setupUI() {
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		contentView.translatesAutoresizingMaskIntoConstraints = false
		imageRocket.translatesAutoresizingMaskIntoConstraints = false
		placeholderImage.translatesAutoresizingMaskIntoConstraints = false
		contentBlockView.translatesAutoresizingMaskIntoConstraints = false
		contentTopBlockView.translatesAutoresizingMaskIntoConstraints = false
		testBtn.translatesAutoresizingMaskIntoConstraints = false
		titleBlock.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate ([
			scrollView.topAnchor.constraint(equalTo: view.topAnchor),
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
			imageRocket.widthAnchor.constraint(equalTo: contentView.widthAnchor),

			placeholderImage.centerXAnchor.constraint(equalTo: imageRocket.centerXAnchor),
			placeholderImage.centerYAnchor.constraint(equalTo: imageRocket.centerYAnchor, constant: -20),
			placeholderImage.heightAnchor.constraint(equalToConstant: Constants.PlaceholderImage.height),
			placeholderImage.widthAnchor.constraint(equalToConstant: Constants.PlaceholderImage.width),

			contentBlockView.topAnchor.constraint(equalTo: imageRocket.bottomAnchor),
			contentBlockView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
			contentBlockView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			contentBlockView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			contentBlockView.heightAnchor.constraint(equalToConstant: 550),

			contentTopBlockView.leftAnchor.constraint(equalTo: imageRocket.leftAnchor),
			contentTopBlockView.rightAnchor.constraint(equalTo: imageRocket.rightAnchor),
			contentTopBlockView.bottomAnchor.constraint(equalTo: imageRocket.bottomAnchor),
			contentTopBlockView.heightAnchor.constraint(equalToConstant: 50),

			testBtn.centerYAnchor.constraint(equalTo: contentBlockView.centerYAnchor),
			testBtn.centerXAnchor.constraint(equalTo: contentBlockView.centerXAnchor),
			testBtn.leftAnchor.constraint(equalTo: contentBlockView.leftAnchor, constant: 16),
			testBtn.rightAnchor.constraint(equalTo: contentBlockView.rightAnchor, constant: 16),
			testBtn.heightAnchor.constraint(equalToConstant: 56),


			titleBlock.topAnchor.constraint(equalTo: contentBlockView.topAnchor),
			titleBlock.heightAnchor.constraint(equalToConstant: 60),
			titleBlock.leftAnchor.constraint(equalTo: contentBlockView.leftAnchor, constant: Constants.ContentBlockView.insetLeft),
			titleBlock.rightAnchor.constraint(equalTo: contentBlockView.rightAnchor, constant: Constants.ContentBlockView.insetRight),


//			contentTopBlockView.centerYAnchor.constraint(equalTo: imageRocket.centerYAnchor),
//			contentTopBlockView.centerXAnchor.constraint(equalTo: imageRocket.centerXAnchor),
//			contentTopBlockView.widthAnchor.constraint(equalToConstant: 50)
//			contentTopBlockView.widthAnchor.constraint(equalTo: imageRocket.widthAnchor),
		])

		imageHeightRocketConstraint =  imageRocket.heightAnchor.constraint(equalToConstant: imageHeight)
		imageHeightRocketConstraint?.isActive = true
	}

	private func configurateUI() {
		scrollView.contentInsetAdjustmentBehavior = .never

		view.backgroundColor = .white
		contentView.backgroundColor = .white
		contentBlockView.backgroundColor = .black
		contentTopBlockView.backgroundColor = Resourses.Colors.primaryBackground

		contentTopBlockView.clipsToBounds = true
		contentTopBlockView.layer.cornerRadius = 24
		contentTopBlockView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

		let image = Resourses.Images.rocket?.withRenderingMode(.alwaysTemplate)

		placeholderImage.tintColor = .white
		placeholderImage.image = image
		imageRocket.backgroundColor = Resourses.Colors.secondaryBackground

		testBtn.tintColor = .white
		testBtn.backgroundColor = .blue
		testBtn.setTitle("Button Title", for: .normal)
		testBtn.addTarget(self, action: #selector(didTapOnTestBtn), for: .touchUpInside)
	}

	/// Update UI after get viewmodel from presenter
	private func updateUI() {
		placeholderImage.isHidden = true
		imageRocket.kf.setImage(with: URL(string: viewModels[0].imageName))
	}
}

// MARK: View input

extension MainViewController: MainViewInput {
	func set(viewModels: [RocketViewModel]) {
		self.viewModels = viewModels
		updateUI()
	}
}

// MARK: Actions

extension MainViewController {
	@objc private func didTapOnTestBtn() {
		print("Tapped")
	}
}
