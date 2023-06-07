//
//  DataStorage.swift
//  AgroMarket
//
//  Created by Guselnikov Gordey on 6/6/23.
//

import Foundation

final class DataStorage {
    
    static let shared = DataStorage()
    
    var users: [User] = [
        User(username: "seller1", password: "pass1", type: .seller, company: Company(companyName: "Компания1", region: "Москва", type: .meat)),
        User(username: "buyer1", password: "pass2", type: .buyer, company: Company(companyName: "Компания2", region: "Санкт-Петербург", type: .resale))
    ]
    
    let categories = ["Мясо" , "Фрукты", "Овощи"]
    
    let meatNames = ["Говядина", "Баранина", "Птица"]
    
    let fruitNames = ["Абрикос", "Груша", "Слива"]
    
    let vegetableNames = ["Морковь", "Помидор", "Лук"]
    
    private init() {}
}
