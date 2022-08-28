import UIKit

final class SettingsViewController: UIViewController {
	private let output: SettingsViewOutput
	
	private let tableView = UITableView()
	private var viewModels: [SettingsViewModel] = []

	init(output: SettingsViewOutput) {
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

// MARK: Setup

extension SettingsViewController {
	private func setupNavigationBar() {
		self.navigationController?.navigationBar.barTintColor = .white
		self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
		self.navigationController?.navigationBar.tintColor = .white
		self.navigationController?.view.backgroundColor = .clear
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)

		setupRightBarButtons()
	}

	private func setupRightBarButtons() {
		let closeButton = UIBarButtonItem(
			title: Resourses.Settings.closeButtonString,
			style: .plain,
			target: self,
			action: #selector(closeBtnTapped)
		)

		self.navigationItem.rightBarButtonItem = closeButton
	}

	private func setupSubviews() {
		tableView.frame = view.bounds
		tableView.dataSource = self
		tableView.rowHeight = UITableView.automaticDimension

		tableView.register(SettingsTableCell.self, forCellReuseIdentifier: String(describing: SettingsTableCell.self))

		view.addSubview(tableView)
	}

	private func configurateUI() {
		view.backgroundColor = Resourses.Colors.primaryBackground
		tableView.backgroundColor = .clear
	}
}

// MARK: View input

extension SettingsViewController: SettingsViewInput {
	func set(title: String) {
		self.title = title
	}

	func set(viewModels: [SettingsViewModel]) {
		self.viewModels = viewModels
		tableView.reloadData()
	}
}

// MARK: Actions

extension SettingsViewController {
	@objc func closeBtnTapped() {
		output.closeBtnTapped()
	}
}

// MARK: TableViewDataSource

extension SettingsViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModels.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsTableCell.self), for: indexPath)
		cell.selectionStyle = .none

		if let cell = cell as? SettingsTableCell {
			cell.configure(model: viewModels[indexPath.row],
										 output: output as? SettingsTableCellOutput)
		}

		return cell
	}
}
