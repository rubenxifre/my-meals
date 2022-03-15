import UIKit

final class RecipesListViewController: UIViewController {

    // MARK: Dependencies
    var presenter: RecipesListPresenterInterface?

    // MARK: Subviews
    private let tableView = UITableView()

    // MARK: Vars
    private var viewData: RecipesListViewData?
    private static let cellIdentifier = "RecipesListCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        registerTableViewCells()
        tableView.dataSource = self
        presenter?.start()
    }
}

extension RecipesListViewController: RecipesListViewInterface {

    func update(with viewData: RecipesListViewData) {
        self.viewData = viewData
        tableView.reloadData()
    }
}

extension RecipesListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewData?.rows.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: RecipesListViewController.cellIdentifier,
            for: indexPath
        )
        if let rowViewData = viewData?.row(atIndex: indexPath.row) {
            var content = cell.defaultContentConfiguration()
            content.text = rowViewData.title
            cell.contentConfiguration = content
        }
        return cell
    }
}

private extension RecipesListViewController {

    func addSubviews() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: tableView.bottomAnchor)
        ])
    }

    func registerTableViewCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: RecipesListViewController.cellIdentifier)
    }
}
