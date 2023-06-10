//
//  ProductsListViewController.swift
//  AgroMarket
//
//  Created by Алексей Турулин on 6/5/23.
//

import UIKit

class ProductsListViewController: UITableViewController {
    
    var users: [User]!
    var currentUser: User?
    var category: String!
    var offers: [Offer]!
    var offersInCurrentCategory: [Offer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category
        
        for offer in offers {
            if offer.product.category == category {
                offersInCurrentCategory.append(offer)
            }
        }
        offersInCurrentCategory.sort {
            $0.product.name < $1.product.name
        }
    }
    
    // MARK: - CategoryListViewControllerDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        offersInCurrentCategory.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let offer = offersInCurrentCategory[indexPath.row]
        var company = ""
        let productName = offer.product.name
        
        for user in users {
            if user.id == offer.userID {
                company = user.company.name
            }
        }
        
        content.text = "\(productName) (\(company))"
        content.secondaryText = "Цена: \(offer.price)\nКоличество: \(offer.quantity)"
        content.image = UIImage(named: "\(productName)")
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - CategoryListViewControllerDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
