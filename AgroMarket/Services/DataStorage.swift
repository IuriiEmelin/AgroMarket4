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
        "user1",
        "user2"
    ]
    
    let passwords = [
        "pass1",
        "pass2"
    ]
    
    let phoneNumbers = [
        "+7(926)953-46-85",
        "+7(903)922-33-13"
    ]
    
    let emails = [
        "parampampam@gmail.com",
        "tututu@yandex.ru"
    ]
    
    // Companies
    let companyNames = [
        "Сельхозпром",
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
