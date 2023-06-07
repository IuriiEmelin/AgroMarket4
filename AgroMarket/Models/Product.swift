//
//  Product.swift
//  AgroMarket
//
//  Created by Guselnikov Gordey on 6/6/23.
//

struct Product {
    
    let name: String
    let price: Int
    let quantity: Int
    let category: Category
//    let company: Company  // TODO: Гамзат
}

enum Category: String, CaseIterable {
    case meat = "Мясо"
    case fruits = "Фрукты"
    case vegetables = "Овощи"
}

extension Product {
    
    static func getProducts() -> [Product] {
        
        var products: [Product] = []

        let meatNames = DataStorage.shared.meatNames
        let fruitNames = DataStorage.shared.fruitNames
        let vegetableNames = DataStorage.shared.vegetableNames
        
        for meatName in meatNames {
            let meatProduct = Product(name: meatName, price: Int.random(in: 100...10000), quantity: Int.random(in: 0...1000), category: .meat)
            products.append(meatProduct)
        }
        
        for fruitName in fruitNames {
            let fruitProduct = Product(name: fruitName, price: Int.random(in: 100...10000), quantity: Int.random(in: 0...1000), category: .fruits)
            products.append(fruitProduct)
        }
        
        for vegetableName in vegetableNames {
            let vegetableProduct = Product(name: vegetableName, price: Int.random(in: 100...10000), quantity: Int.random(in: 0...1000), category: .vegetables)
            products.append(vegetableProduct)
        }
        
        return products
    }
}

// Enum for Pictures
enum Picture: String, CaseIterable {
    case beef = "beef"
    case lamb = "lamb"
    case poultry = "poultry"
    case apricot = "apricot"
    case pear = "pear"
    case plum = "plum"
    case carrot = "carrot"
    case tomato = "tomato"
    case onion = "onion"
}

// Enum for Pictures
enum CategoryPicture: String {
    case meat = "meat"
    case fruits = "fruits"
    case vegetables = "vegetables"
}
