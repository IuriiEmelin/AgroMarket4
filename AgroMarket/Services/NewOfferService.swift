//
//  NewOfferService.swift
//  AgroMarket
//
//  Created by Даниил Чупин on 10.06.2023.
//

import Foundation
import UIKit

final class OfferService {
    static var categories:[String: (String, UIImage)] =
    {
        var items = [String: (String, UIImage)]()
        items["meat"] = ("Мясо", UIImage(named: "Мясо") ?? UIImage())
        items["vegetables"] = ("Овощи", UIImage(named: "Овощи") ?? UIImage())
        items["fruits"] = ("Фрукты", UIImage(named: "Фрукты") ?? UIImage())
        
        return items
    }()
    
    static var names:[String: (String, UIImage)] =
    {
        var items = [String: (String, UIImage)]()
        items["beef"] = ("Говядина", UIImage(named: "Говядина") ?? UIImage())
        items["mutton"] = ("Баранина", UIImage(named: "Баранина") ?? UIImage())
        items["chicken"] = ("Курица", UIImage(named: "Курица") ?? UIImage())
        
        items["carrot"] = ("Морковь", UIImage(named: "Морковь") ?? UIImage())
        items["tomato"] = ("Помидоры", UIImage(named: "Помидоры") ?? UIImage())
        items["orion"] = ("Лук", UIImage(named: "Лук") ?? UIImage())
        
        items["apple"] = ("Яблоки", UIImage(named: "Яблоки") ?? UIImage())
        items["pear"] = ("Груши", UIImage(named: "Груши") ?? UIImage())
        items["plum"] = ("Сливы", UIImage(named: "Сливы") ?? UIImage())
        
        return items
    }()
        
    static var products = [
        "meat": [
            "beef",
            "mutton",
            "chicken"
        ],
        "vegetables": [
            "carrot",
            "tomato",
            "orion"
        ],
        "fruits": [
            "apple",
            "pear",
            "plum"
        ]
    ]
}
