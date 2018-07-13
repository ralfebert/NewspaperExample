import UIKit

class StoryViewController : UIViewController {

    let articleId : Int
    let newsService : NewsService

    init(articleId : Int, newsService : NewsService) {
        self.articleId = articleId
        self.newsService = newsService
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
    }

    @IBOutlet var textView: UITextView!

    var article : Article? {
        didSet {
            self.view.setNeedsLayout()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.newsService.getArticle(id: self.articleId) { article in
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
