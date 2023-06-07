//
//  CategoryListViewController.swift
//  AgroMarket
//
//  Created by Алексей Турулин on 6/5/23.
//

import UIKit

final class CategoryListViewController: UITableViewController {
    
    var user: User?
    var products: [Product]?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let productsListVC = segue.destination as? ProductsListViewController else { return }
        guard let category = sender as? Category else { return }
//        productsListVC.user = user
//        productsListVC.products = products
//        productsListVC.category = category
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Category.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "сategory", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = Category.allCases[indexPath.row].rawValue
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowProductsScreen", sender: Category.allCases[indexPath.row])
    }
}


