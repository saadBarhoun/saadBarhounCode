//
//  NewListTableViewController.swift
//  NewsMVVM
//
//  Created by Saad barhoun on 11/11/2021.
//

import Foundation
import UIKit

class ArticlesListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    var viewModel = ArticlesListViewModel()
   
    private func setup(){
        viewModel.getArticles()
        
        viewModel.bindNewsListResult = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError()
        }
        
        
        let article = self.viewModel.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = article?.title
        cell.descLabel.text = article?.byLine
        cell.dateLabel.text = article?.published_date
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! NewsDetailsViewController
        secondViewController.index = indexPath.row
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }

}


