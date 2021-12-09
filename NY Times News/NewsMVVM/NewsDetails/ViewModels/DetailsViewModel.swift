
import Foundation
    
struct DetailsViewModel {
    
    private let article : Article
    
    init(_ article: Article) {
        self.article = article
    }
    
    var abstract: String{
        return self.article.abstract
    }
}

class DetailsListVM{
    
    var articles : [Article]?
    {
        didSet{
            self.bindNewsListResult()
        }
    }
    var bindNewsListResult : (() -> ()) = {}
        
    func getArticles(){
        WebServices.shared.getArticles { [weak self] result in
            if let result = result {
                self?.articles = result
            }else{
                
            }
        }
    }
    
    func articleAtIndex(_ index: Int) -> DetailsViewModel? {
        guard let articles = articles else { return nil}
        let article = articles[index]
        return DetailsViewModel(article)
    }
}
    

