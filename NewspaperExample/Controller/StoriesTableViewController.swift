import UIKit

class StoriesTableViewController: UITableViewController {

    let newsService : NewsService

    init(newsService : NewsService) {
        self.newsService = newsService
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
    }

    var onHeadlineSelected : ((Headline) -> Void)?

    var headlines = [Headline]() {
        didSet {
            self.navigationItem.title = "\(headlines.count) Stories"
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LabelCell")

        self.newsService.getHeadlines { headlines in
            self.headlines = headlines
        }
    }

    // MARK: - protocol UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.headlines.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        let data = headlines[indexPath.row]

        cell.textLabel?.text = data.title

        return cell
    }

    // MARK: - protocol UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.onHeadlineSelected?(self.headlines[indexPath.row])
    }

}
