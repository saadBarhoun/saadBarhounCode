
import Foundation
    
struct ArticleViewModel {
    private let article : Article
    
    init(_ article: Article) {
        self.article = article
    }
    
    var title: String {
       return self.article.title
    }
    
    var published_date: String{
        return self.article.published_date
    }

    var byLine: String{
        return self.article.byline
    }

}
    

