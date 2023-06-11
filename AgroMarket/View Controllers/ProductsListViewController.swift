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
    
    
    // MARK: - Private Properties
    private var offersInCurrentCategory: [Offer] = []
    private var offersInCurrentSection: [Offer] = []
    private var offerTypes: [String] = []
    
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
        
        offerTypes = getOfferTypes()
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
    override func numberOfSections(in tableView: UITableView) -> Int {
        offerTypes.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        offerTypes[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        offersInCurrentSection = getOffersIn(section: section)
        
        return offersInCurrentSection.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        offersInCurrentSection = getOffersIn(section: indexPath.section)
        let offer = offersInCurrentSection[indexPath.row]
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
    
    private func getOfferTypes() -> [String] {
        var offerTypes: [String] = []
        for offer in offersInCurrentCategory {
            if !offerTypes.contains(offer.product.name) {
                offerTypes.append(offer.product.name)
            }
        }
        offerTypes.sort()
        return offerTypes
    }
    
    private func getOffersIn(section: Int) -> [Offer] {
        var offers: [Offer] = []
        
        for offer in offersInCurrentCategory {
            if offer.product.name == offerTypes[section] {
                offers.append(offer)
            }
        }
        
        return offers
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetailsScreen", sender: offersInCurrentCategory[indexPath.row])
    }
}
