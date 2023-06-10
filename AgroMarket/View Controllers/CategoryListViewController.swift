//
//  CategoryListViewController.swift
//  AgroMarket
//
//  Created by Алексей Турулин on 6/5/23.
//

import UIKit

final class CategoryListViewController: UITableViewController {
    
    // MARK: - Properties
    var users: [User]!
    var currentUser: User?
    
    // MARK: - Private Properties
    private let offers = Offer.getOffers()
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let category = sender as? String else { return }
        guard let productsListVC = segue.destination as? ProductsListViewController else { return }
        
        productsListVC.users = users
        productsListVC.currentUser = currentUser
        productsListVC.category = category
        productsListVC.offers = offers
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Offer.categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "сategory", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let category = Offer.categories[indexPath.row]
        
        content.text = category
        content.image = UIImage(named: "\(category)")
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowProductsScreen", sender: Offer.categories[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}


