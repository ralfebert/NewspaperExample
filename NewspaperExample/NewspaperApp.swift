import UIKit

@UIApplicationMain
class NewspaperApp: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private var newsService = ExampleNewsService()
    private var navigationController : UINavigationController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = self.createWindow()

        return true
    }

    private func createWindow() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let controller = controllerForStories()
        let navController = UINavigationController(rootViewController: controller)
        self.navigationController = navController
        window.rootViewController = navController
        window.makeKeyAndVisible()
        return window
    }

    private func controllerForStories() -> StoriesTableViewController {
        let controller = StoriesTableViewController(newsService: self.newsService)
        controller.onHeadlineSelected = { (headline) in
            self.navigationController?.pushViewController(self.controller(forArticleId: headline.id), animated: true)
        }
        return controller
    }

    private func controller(forArticleId id: Int) -> StoryViewController {
        let controller = StoryViewController(articleId: id, newsService: self.newsService)
        return controller
    }

}
