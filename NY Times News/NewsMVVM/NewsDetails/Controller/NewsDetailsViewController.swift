//
//  abstractController.swift
//  NewsMVVM
//
//  Created by Saad barhoun on 02/12/2021.
//

import Foundation
import UIKit

class NewsDetailsViewController: UIViewController{
    
    @IBOutlet weak var abstractLabel: UILabel!
    
    var viewModel = DetailsListVM()
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getArticles()
        
        viewModel.bindNewsListResult = {
            let article = self.viewModel.articleAtIndex(self.index)
            DispatchQueue.main.async {
                self.abstractLabel.text = article?.abstract
            }
        }
    }
 
    
    
    
}
