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

		setupSubviews()
	}

	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
}

// MARK: View input

extension DetailsViewController: DetailsViewInput {
	func set(viewModels: [LaunchViewModel]) {
		self.viewModels = viewModels
		tableView.reloadData()
	}
}

// MARK: Private

extension DetailsViewController {
	private func setupSubviews() {
		tableView.frame = view.bounds
//		tableView.delegate = self
		tableView.dataSource = self

		tableView.register(DetailsLaunchesCell.self, forCellReuseIdentifier: String(describing: DetailsLaunchesCell.self))

		view.addSubview(tableView)

		setupUI()
		configurateUI()
	}

	private func setupUI() {

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

// MARK: TableViewDelegate

//extension DetailsViewController: UITableViewDelegate {
//
//}
//
