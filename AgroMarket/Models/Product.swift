//
//  Product.swift
//  AgroMarket
//
//  Created by Guselnikov Gordey on 6/6/23.
//
import Foundation

struct Product {
    let name: String
    let category: String
}

struct Offer {
    let product: Product
    let price: Int
    let quantity: Int
    let userID: Int
    
    var totalPrice: Int {
        price * quantity
    }
    
    static var categories: [String] = []
}

extension Product {
    static func getProducts() -> [Product] {
        var products: [Product] = []
        
        for (category, names) in DataStorage.shared.products {
            Offer.categories.append(category)
            for name in names {
                products.append(Product(name: name, category: category))
            }
        }
        Offer.categories.sort()
        return products
    }
}

extension Offer {
    static func getOffers() -> [Offer] {
        let products = Product.getProducts().shuffled()
        let users = User.getUsers().shuffled()
        
        var offers: [Offer] = []
        
        for _ in 1...10 {
            let offer = Offer(
                product: products[Int.random(in: 0..<products.count)],
                price: Int.random(in: 100...500),
                quantity: Int.random(in: 100...1000),
                userID: users[Int.random(in: 0..<users.count)].id
            )
            offers.append(offer)        
        }
    
        return offers
    }
}
