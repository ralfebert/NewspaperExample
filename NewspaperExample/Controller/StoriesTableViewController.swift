import UIKit

class StoriesTableViewController: UITableViewController {

    var headlines = [Headline]() {
        didSet {
            self.navigationItem.title = "\(headlines.count) Stories"
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NewsService.default.getHeadlines { headlines in
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

    // MARK: - segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let controller = segue.destination as? StoryViewController {
            let cell = sender as! UITableViewCell
            let indexPath = self.tableView.indexPath(for: cell)!
            let data = headlines[indexPath.row]
            controller.articleId = data.id
        }

    }

}
