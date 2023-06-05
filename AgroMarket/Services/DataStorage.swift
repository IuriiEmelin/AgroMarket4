//
//  DataStorage.swift
//  AgroMarket
//
//  Created by Guselnikov Gordey on 6/6/23.
//

import Foundation

final class DataStorage {
    
    static let shared = DataStorage()
    
    let categories = ["Мясо" , "Фрукты", "Овощи"]
    
    let meatNames = ["Говядина", "Баранина", "Птица"]
    
    let fruitNames = ["Абрикос", "Груша", "Слива"]
    
    let vegetableNamea = ["Морковь", "Помидор", "Лук"]
    
    private init() {}
}
