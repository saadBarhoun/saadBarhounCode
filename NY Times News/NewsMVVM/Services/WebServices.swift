//
//  WebServices.swift
//  NewsMVVM
//
//  Created by Saad barhoun on 11/11/2021.
//

import Foundation

class WebServices {
    
    static let shared = WebServices()
    
    func getArticles(completion: @escaping ([Article]?) -> () ){
        
        URLSession.shared.dataTask(with: URL (string: Constants.articlesUrl)!){data, response , error in
        if let error = error {
            print(error.localizedDescription)
            completion(nil)
        }else if let data = data {
            let articleList =  try? JSONDecoder().decode(ArticlesList .self, from: data)
            if let articleList = articleList {
                completion(articleList.results)
            }
        }
    }.resume()
        
    }
}
