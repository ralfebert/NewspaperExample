struct Headline {

    var id : Int
    var title : String

}

struct Article {

    var id : Int
    var title : String
    var text : String

}

protocol NewsService {
    func getHeadlines(resultHandler : ([Headline]) -> Void)
    func getArticle(id : Int, resultHandler : (Article) -> Void)
}

class ExampleNewsService : NewsService {

    var exampleArticles = [
        Article(id: 1, title: "Lorem Ipsum", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque id ornare tortor, quis dictum enim. Morbi convallis tincidunt quam eget bibendum. Suspendisse malesuada maximus ante, at molestie massa fringilla id."),
        Article(id: 2, title: "Aenean condimentum", text: "Ut eget massa erat. Morbi mauris diam, vulputate at luctus non, finibus et diam. Morbi et felis a lacus pharetra blandit."),
        Article(id: 3, title: "In ac ante sapien", text: "Aliquam egestas ultricies dapibus. Nam molestie nunc in ipsum vehicula accumsan quis sit amet quam. Sed vel feugiat eros."),
    ]

    func getHeadlines(resultHandler : ([Headline]) -> Void) {
        let headlines = self.exampleArticles.map { Headline(id: $0.id, title: $0.title) }
        resultHandler(headlines)
    }

    func getArticle(id : Int, resultHandler : (Article) -> Void) {
        let article = self.exampleArticles.first(where: { $0.id == id })!
        resultHandler(article)
    }

}
