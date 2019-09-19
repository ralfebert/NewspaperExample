import UIKit

struct Headline {
    var id : Int
    var date : Date
    var title : String
    var text : String
    var image : String
}

private func parseDate(_ str : String) -> Date {
    let dateFormat = DateFormatter()
    dateFormat.dateFormat = "yyyy-MM-dd"
    return dateFormat.date(from: str)!
}

class StoriesTableViewController: UITableViewController {

    var headlines = [
        Headline(id: 1, date: parseDate("2018-05-15"), title: "Proin suscipit maximus", text: "Quisque ultrices odio in neque eleifend eleifend. Praesent tincidunt euismod sem, et rhoncus lorem facilisis eget.", image: "Blueberry"),
        Headline(id: 2, date: parseDate("2018-02-15"), title: "In ac ante sapien", text: "Aliquam egestas ultricies dapibus. Nam molestie nunc in ipsum vehicula accumsan quis sit amet quam. Sed vel feugiat eros.", image: "Cantaloupe"),
        Headline(id: 3, date: parseDate("2018-03-05"), title: "Lorem Ipsum", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque id ornare tortor, quis dictum enim. Morbi convallis tincidunt quam eget bibendum. Suspendisse malesuada maximus ante, at molestie massa fringilla id.", image: "Apple"),
        Headline(id: 4, date: parseDate("2018-02-10"), title: "Aenean condimentum", text: "Ut eget massa erat. Morbi mauris diam, vulputate at luctus non, finibus et diam. Morbi et felis a lacus pharetra blandit.", image: "Banana"),
    ]

    // MARK: - View Controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.headlines.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)

        let headline = self.headlines[indexPath.row]
        cell.textLabel?.text = headline.title
        cell.detailTextLabel?.text = headline.text
        cell.imageView?.image = UIImage(named: headline.image)

        return cell
    }

}
