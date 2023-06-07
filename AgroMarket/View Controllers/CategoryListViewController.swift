//
//  CategoryListViewController.swift
//  AgroMarket
//
//  Created by Алексей Турулин on 6/5/23.
//

import UIKit

final class CategoryListViewController: UITableViewController {
    
    var currentUser: User?
    var products: [Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Category.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "сategory", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = Category.allCases[indexPath.row].rawValue.uppercased()
        cell.contentConfiguration = content
        
        return cell
    }
}
