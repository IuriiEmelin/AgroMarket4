//
//  ProductsListViewController.swift
//  AgroMarket
//
//  Created by Алексей Турулин on 6/5/23.
//

import UIKit

final class ProductsListViewController: UITableViewController {
    
    // MARK: - Properties
    var users: [User]!
    var currentUser: User?
    var category: String!
    var offers: [Offer]!
    var offersInCurrentCategory: [Offer] = []
    
    // MARK: - View Life Cycle
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
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let productDetailsVC = segue.destination as? ProductDetailsViewController else { return }
        guard let currentOffer = sender as? Offer else { return }
        
        productDetailsVC.currentOffer = currentOffer
        productDetailsVC.users = users
        productDetailsVC.category = category
    }
    
    // MARK: - UITableViewDataSource
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
        content.secondaryText = "Стоимость: \(offer.totalPrice) руб. (\(offer.price) руб. за кг.)\nКоличество: \(offer.quantity) кг."
        content.image = UIImage(named: "\(productName)")
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetailsScreen", sender: offersInCurrentCategory[indexPath.row])
    }
}
