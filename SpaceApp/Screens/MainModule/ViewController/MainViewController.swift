import UIKit
import Kingfisher

final class MainViewController: UIViewController {
	private enum Constants {
		enum MainRocketImage {
			static let initialHeight: CGFloat = 150
		}

		enum PlaceholderImage {
			static let topInset: CGFloat = -20
			static let height: CGFloat = 80
			static let width: CGFloat = 80
		}

		enum TopContentBlock {
			static let height: CGFloat = 40
			static let cornerRadius: CGFloat = 24
		}

		enum ContentBlockView {
			static let insetLeft: CGFloat = 32
			static let insetRight: CGFloat = -32
		}

		enum TitleBlock {
			static let height: CGFloat = 60
		}

		enum MainInfoBlock{
			static let minHeight: CGFloat = 160
		}

		enum StageBlock {
			static let insetLeft: CGFloat = 32
			static let insetRight: CGFloat = -32
			static let minHeight: CGFloat = 186
		}

		enum LaunchesButton {
			static let insetTop: CGFloat = 12
			static let insetLeft: CGFloat = 32
			static let insetRight: CGFloat = -32
			static let insetBottom: CGFloat = -92
			static let height: CGFloat = 72
		}

		enum PageControl {
			static let heightContainer: CGFloat = 75
			static let topInsetToControls: CGFloat = 10
		}
	}

	private let output: MainViewOutput

	private let scrollView = UIScrollView()
	private let pageControl = UIPageControl()
	private let pageControlView = UIView()
	private let contentView = UIView()
	private let imageRocket = UIImageView()
	private let contentBlockView = UIView()
	private let contentTopBlockView = UIView()
	private let placeholderImage = UIImageView()
	private lazy var titleBlock = HeadingBlockRocket.loadFromNib()
	private lazy var featuresBlock = FeaturesBlockRocket.loadFromNib()
	private lazy var mainInfoBlock = MainInfoBlockRocket()
	private lazy var firstStageBlock = StageInfoBlockRocket()
	private lazy var secondStageBlock = StageInfoBlockRocket()
	private lazy var launchesButtonBlock = ButtonLaunchesBlockRocket()

	private var imageHeight: CGFloat = Constants.MainRocketImage.initialHeight
	private var imageHeightRocketConstraint: NSLayoutConstraint?
	private var isFirstLoading = true

	private var viewModels = [RocketViewModel]()

	private var numberRocketToShow = 0

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

		let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
		swipeLeft.direction = .left
		self.view.addGestureRecognizer(swipeLeft)

		let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
		swipeRight.direction = .right
		self.view.addGestureRecognizer(swipeRight)
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.setNavigationBarHidden(false, animated: animated)
	}

	override func viewDidLayoutSubviews() {
		if isFirstLoading {
			imageHeight = view.layer.frame.height / 2.2
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
		view.addSubview(pageControlView)
		pageControlView.addSubview(pageControl)
		scrollView.addSubview(contentView)
		contentView.addSubview(imageRocket)
		imageRocket.addSubview(contentTopBlockView)
		imageRocket.addSubview(placeholderImage)
		contentView.addSubview(contentBlockView)
		contentBlockView.addSubview(titleBlock)
		contentBlockView.addSubview(featuresBlock)
		contentBlockView.addSubview(mainInfoBlock)
		contentBlockView.addSubview(firstStageBlock)
		contentBlockView.addSubview(secondStageBlock)
		contentBlockView.addSubview(launchesButtonBlock)

		setupUI()
		configurateUI()
	}

	private func setupUI() {
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		pageControlView.translatesAutoresizingMaskIntoConstraints = false
		pageControl.translatesAutoresizingMaskIntoConstraints = false
		contentView.translatesAutoresizingMaskIntoConstraints = false
		imageRocket.translatesAutoresizingMaskIntoConstraints = false
		placeholderImage.translatesAutoresizingMaskIntoConstraints = false
		contentBlockView.translatesAutoresizingMaskIntoConstraints = false
		contentTopBlockView.translatesAutoresizingMaskIntoConstraints = false
		titleBlock.translatesAutoresizingMaskIntoConstraints = false
		featuresBlock.translatesAutoresizingMaskIntoConstraints = false
		mainInfoBlock.translatesAutoresizingMaskIntoConstraints = false
		firstStageBlock.translatesAutoresizingMaskIntoConstraints = false
		secondStageBlock.translatesAutoresizingMaskIntoConstraints = false
		launchesButtonBlock.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate ([
			pageControlView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			pageControlView.leftAnchor.constraint(equalTo: view.leftAnchor),
			pageControlView.rightAnchor.constraint(equalTo: view.rightAnchor),
			pageControlView.heightAnchor.constraint(equalToConstant: Constants.PageControl.heightContainer),

			pageControl.topAnchor.constraint(equalTo: pageControlView.topAnchor, constant: Constants.PageControl.topInsetToControls),
			pageControl.centerXAnchor.constraint(equalTo: pageControlView.centerXAnchor),

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
			placeholderImage.centerYAnchor.constraint(equalTo: imageRocket.centerYAnchor, constant: Constants.PlaceholderImage.topInset),
			placeholderImage.heightAnchor.constraint(equalToConstant: Constants.PlaceholderImage.height),
			placeholderImage.widthAnchor.constraint(equalToConstant: Constants.PlaceholderImage.width),

			contentBlockView.topAnchor.constraint(equalTo: imageRocket.bottomAnchor),
			contentBlockView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
			contentBlockView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			contentBlockView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

			contentTopBlockView.leftAnchor.constraint(equalTo: imageRocket.leftAnchor),
			contentTopBlockView.rightAnchor.constraint(equalTo: imageRocket.rightAnchor),
			contentTopBlockView.bottomAnchor.constraint(equalTo: imageRocket.bottomAnchor),
			contentTopBlockView.heightAnchor.constraint(equalToConstant: Constants.TopContentBlock.height),

			titleBlock.topAnchor.constraint(equalTo: contentBlockView.topAnchor),
			titleBlock.heightAnchor.constraint(equalToConstant: Constants.TitleBlock.height),
			titleBlock.leftAnchor.constraint(equalTo: contentBlockView.leftAnchor, constant: Constants.ContentBlockView.insetLeft),
			titleBlock.rightAnchor.constraint(equalTo: contentBlockView.rightAnchor, constant: Constants.ContentBlockView.insetRight),

			featuresBlock.topAnchor.constraint(equalTo: titleBlock.bottomAnchor),
			featuresBlock.leftAnchor.constraint(equalTo: contentBlockView.leftAnchor),
			featuresBlock.rightAnchor.constraint(equalTo: contentBlockView.rightAnchor),

			mainInfoBlock.topAnchor.constraint(equalTo: featuresBlock.bottomAnchor),
			mainInfoBlock.leftAnchor.constraint(equalTo: contentBlockView.leftAnchor),
			mainInfoBlock.rightAnchor.constraint(equalTo: contentBlockView.rightAnchor),
			mainInfoBlock.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.MainInfoBlock.minHeight),

			firstStageBlock.topAnchor.constraint(equalTo: mainInfoBlock.bottomAnchor),
			firstStageBlock.leftAnchor.constraint(equalTo: contentBlockView.leftAnchor, constant: Constants.StageBlock.insetLeft),
			firstStageBlock.rightAnchor.constraint(equalTo: contentBlockView.rightAnchor, constant: Constants.StageBlock.insetRight),
			firstStageBlock.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.StageBlock.minHeight),

			secondStageBlock.topAnchor.constraint(equalTo: firstStageBlock.bottomAnchor),
			secondStageBlock.leftAnchor.constraint(equalTo: contentBlockView.leftAnchor, constant: Constants.StageBlock.insetLeft),
			secondStageBlock.rightAnchor.constraint(equalTo: contentBlockView.rightAnchor, constant: Constants.StageBlock.insetRight),
			secondStageBlock.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.StageBlock.minHeight),

			launchesButtonBlock.topAnchor.constraint(equalTo: secondStageBlock.bottomAnchor, constant: Constants.LaunchesButton.insetTop),
			launchesButtonBlock.leftAnchor.constraint(equalTo: contentBlockView.leftAnchor, constant: Constants.LaunchesButton.insetLeft),
			launchesButtonBlock.rightAnchor.constraint(equalTo: contentBlockView.rightAnchor, constant: Constants.LaunchesButton.insetRight),
			launchesButtonBlock.heightAnchor.constraint(equalToConstant: Constants.LaunchesButton.height),
			launchesButtonBlock.bottomAnchor.constraint(equalTo: contentBlockView.bottomAnchor, constant: Constants.LaunchesButton.insetBottom)
		])

		imageHeightRocketConstraint =  imageRocket.heightAnchor.constraint(equalToConstant: imageHeight)
		imageHeightRocketConstraint?.isActive = true
	}

	private func configurateUI() {
		scrollView.contentInsetAdjustmentBehavior = .never

		pageControlView.backgroundColor = Resourses.Colors.secondaryBackground
		pageControl.pageIndicatorTintColor = Resourses.Colors.secondControl
		pageControl.currentPageIndicatorTintColor = Resourses.Colors.activeControl
		pageControl.isUserInteractionEnabled = false
		
		view.backgroundColor = Resourses.Colors.primaryBackground
		contentView.backgroundColor = .white
		contentBlockView.backgroundColor = .black
		contentTopBlockView.backgroundColor = Resourses.Colors.primaryBackground

		contentTopBlockView.clipsToBounds = true
		contentTopBlockView.layer.cornerRadius = Constants.TopContentBlock.cornerRadius
		contentTopBlockView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

		let image = Resourses.Images.rocket?.withRenderingMode(.alwaysTemplate)

		placeholderImage.tintColor = .white.withAlphaComponent(0.5)
		placeholderImage.image = image
		imageRocket.backgroundColor = Resourses.Colors.secondaryBackground
	}

	private func updateUI() {
		placeholderImage.isHidden = true
		imageRocket.image = nil
		imageRocket.kf.setImage(with: URL(string: viewModels[numberRocketToShow].imageName))

		titleBlock.setup(title: viewModels[numberRocketToShow].title,
										 output: output as? HeadingBlockRocketViewOutput)
		featuresBlock.setup(viewModels: viewModels[numberRocketToShow].features)
		mainInfoBlock.update(viewModels: viewModels[numberRocketToShow].mainInfo)
		firstStageBlock.update(viewModel: viewModels[numberRocketToShow].firstStageInfo)
		secondStageBlock.update(viewModel: viewModels[numberRocketToShow].secondStageInfo)
		launchesButtonBlock.setup(
			textButton: Resourses.Buttons.launchesButtonString,
			idRocket: viewModels[numberRocketToShow].id,
			nameRocket: viewModels[numberRocketToShow].title,
			output: output as? ButtonLaunchesBlockRocketViewOutput
		)
	}
}

// MARK: View input

extension MainViewController: MainViewInput {
	func set(viewModels: [RocketViewModel]) {
		self.viewModels = viewModels
		self.pageControl.numberOfPages = viewModels.count
		self.pageControl.currentPage = numberRocketToShow
		updateUI()
	}

	func showPreviousRocket() {
		guard numberRocketToShow != 0 else {
			return
		}
		numberRocketToShow -= 1
		pageControl.currentPage = numberRocketToShow
		updateUI()
	}

	func showNextRocket() {
		guard numberRocketToShow != (viewModels.count - 1) else {
			return
		}
		numberRocketToShow += 1
		pageControl.currentPage = numberRocketToShow
		updateUI()
	}
}

// MARK: Actions

extension MainViewController {
	@objc private func handleGesture(gesture: UISwipeGestureRecognizer) {
		if gesture.direction == .right {
			output.didSwipeRight()
		} else if gesture.direction == .left {
			output.didSwipeLeft()
		}
	}
}
