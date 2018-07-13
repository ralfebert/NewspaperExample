import UIKit

class StoryViewController : UIViewController {

    @IBOutlet var textView: UITextView!

    var articleId : Int?

    var article : Article? {
        didSet {
            self.view.setNeedsLayout()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NewsService.default.getArticle(id: self.articleId!) { article in
            self.article = article
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        if let article = self.article {
            self.textView.text = article.text
            self.title = article.title
        }
    }

}
