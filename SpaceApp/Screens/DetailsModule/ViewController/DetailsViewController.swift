import UIKit

final class DetailsViewController: UIViewController {
	private let output: DetailsViewOutput

	private let tableView = UITableView()
	private var viewModels: [LaunchViewModel] = []

	init(output: DetailsViewOutput) {
		self.output = output
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		output.viewDidLoad()

		setupNavigationBar()
		setupSubviews()
		configurateUI()
	}
}

// MARK: View input

extension DetailsViewController: DetailsViewInput {
	func set(title: String) {
		self.title = title
	}

	func set(viewModels: [LaunchViewModel]) {
		self.viewModels = viewModels
		tableView.reloadData()
	}
}

// MARK: Private

extension DetailsViewController {
	private func setupNavigationBar() {
		self.navigationController?.navigationBar.barStyle = .black
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.isTranslucent = true
		self.navigationController?.navigationBar.barTintColor = .white
		self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
		self.navigationController?.navigationBar.tintColor = .white
		self.navigationController?.view.backgroundColor = .clear

		let backButton = UIBarButtonItem()
		backButton.title = Resourses.Buttons.backButtonString
		self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
	}

	private func setupSubviews() {
		tableView.frame = view.bounds
		tableView.dataSource = self

		tableView.rowHeight = UITableView.automaticDimension

		tableView.register(DetailsLaunchesCell.self, forCellReuseIdentifier: String(describing: DetailsLaunchesCell.self))

		view.addSubview(tableView)
	}

	private func configurateUI() {
		view.backgroundColor = Resourses.Colors.primaryBackground
		tableView.backgroundColor = .clear
	}
}

// MARK: TableViewDataSource

extension DetailsViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModels.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailsLaunchesCell.self), for: indexPath)
		cell.selectionStyle = .none

		if let cell = cell as? DetailsLaunchesCell {
			cell.configure(model: viewModels[indexPath.row])
		}

		return cell
	}
}
