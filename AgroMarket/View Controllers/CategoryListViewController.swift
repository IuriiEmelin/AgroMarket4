//
//  CategoryListViewController.swift
//  AgroMarket
//
//  Created by Алексей Турулин on 6/5/23.
//

import UIKit

final class CategoryListViewController: UITableViewController {
    
    var users: [User]!
    var currentUser: User?
    
    private let offers = Offer.getOffers()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let category = sender as? String else { return }
        guard let productsListVC = segue.destination as? ProductsListViewController else { return }
        productsListVC.users = users
        productsListVC.currentUser = currentUser
        productsListVC.category = category
        productsListVC.offers = offers
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Offer.categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "сategory", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = Offer.categories[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowProductsScreen", sender: Offer.categories[indexPath.row])
    }
}


