//
//  ProductDetailsViewController.swift
//  AgroMarket
//
//  Created by Алексей Турулин on 6/5/23.
//

import UIKit

final class ProductDetailsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var offerImage: UIImageView!
    
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var totalPriceLabel: UILabel!
    
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    // MARK: - Properties
    var currentOffer: Offer!
    var users: [User]!
    var category: String!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Private Methods
    private func updateUI() {
        guard let category else { return }
        var company = ""
        var offerOwner: User!
        let productName = currentOffer.product.name
        
        for user in users {
            if user.id == currentOffer.userID {
                offerOwner = user
                break
            }
        }
        
        offerImage.image = UIImage(named: productName)
        
        companyLabel.text = "Производитель: \(offerOwner.company.name)"
        locationLabel.text = "Регион: \(offerOwner.company.region)"
        categoryLabel.text = "Категория: \(category)"
        productNameLabel.text = "Наименование: \(productName)"
        priceLabel.text = "Цена за ед.: \(currentOffer.price) руб."
        quantityLabel.text = "Количество: \(currentOffer.quantity) кг."
        totalPriceLabel.text = "Стоимость: \(currentOffer.totalPrice) руб."
        
        phoneLabel.text = "Телефон: \(offerOwner.phoneNumber)"
        emailLabel.text = "Эл. почта: \(offerOwner.email)"
    }
    
}
