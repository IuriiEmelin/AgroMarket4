//
//  DataStorage.swift
//  AgroMarket
//
//  Created by Guselnikov Gordey on 6/6/23.
//

import Foundation

final class DataStorage {
    
    static let shared = DataStorage()
    
    // Users
    let usernames = [
        "seller1",
        "buyer1"
    ]
    
    let passwords = [
        "pass1",
        "pass2"
    ]
    
    // Companies
    let companyNames = [
        "Газ-мяс",
        "Агро"
    ]
    
    let regions = [
        "Москва",
        "Санкт-Петербург",
    ]
    
    // Products
    let products = [
        "Мясо": [
            "Говядина",
            "Баранина",
            "Курица"
        ],
        "Овощи": [
            "Морковь",
            "Помидоры",
            "Лук"
        ],
        "Фрукты": [
            "Яблоки",
            "Груши",
            "Сливы"
        ]
    ]
    
    private init() {}
}
