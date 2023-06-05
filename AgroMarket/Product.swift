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

//struct Category {
//    name: String
//}

enum Category: String, CaseIterable {
    case meat
    case fruits
    case vegetables
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

extension Product {
    
    static func getProducts() -> [Product] {
        
        var products: [Product] = []
        
//        let categories = DataStorage.shared.categories
        let meatNames = DataStorage.shared.meatNames
        let fruitNames = DataStorage.shared.fruitNames
        let vegetableNames = DataStorage.shared.vegetableNamea
        
        for category in Category.allCases {
            
            switch category {
            case .meat:
                for meatName in meatNames {
                    let meat = Product(name: meatName,
                                       price: Int.random(in: 100...10000),
                                       quantity: Int.random(in: 0...1000),
                                       category: Category.meat)
                    products.append(meat)
                }
            case .fruits:
                for fruitName in fruitNames {
                    let fruit = Product(name: fruitName,
                                        price: Int.random(in: 100...10000),
                                        quantity: Int.random(in: 0...1000),
                                        category: Category.fruits)
                    products.append(fruit)
                }
            case .vegetables:
                for vegetableName in vegetableNames {
                    let vegetable = Product(name: vegetableName,
                                            price: Int.random(in: 100...10000),
                                            quantity: Int.random(in: 0...1000),
                                            category: Category.vegetables)
                    products.append(vegetable)
                }
            }
            
        }
        
        return products
    }
}
