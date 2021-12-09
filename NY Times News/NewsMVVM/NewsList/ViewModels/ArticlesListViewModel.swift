//
//  NewsListViewModel.swift
//  NewsMVVM
//
//  Created by Saad barhoun on 07/12/2021.
//

import Foundation

class ArticlesListViewModel{
    var articles : [Article]?{
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
    var numberOfSection: Int{
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles?.count ?? 0
    }
    
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel? {
        guard let articles = articles else { return nil}
        let article = articles[index]
        return ArticleViewModel(article)
    }
    
}
