//
//  User.swift
//  AgroMarket
//
//  Created by Гамзат Гасанов on 07.06.2023.
//

import Foundation

enum UserType: String {
    case buyer = "Покупатель"
    case seller = "Продавец"
}

enum CompanyType: String {
    case meat = "Скотоводство"
    case vegetable = "Овощеводство"
    case fruit = "Плодоводство"
    case resale = "Перепродажа"
}

struct User {
    let username: String
    let password: String
    let type: UserType
    let company: Company
}

struct Company {
    let companyName: String
    let region: String
    let type: CompanyType
}

extension User {
    static func getUsers() -> [User] {
        return [
            User(username: "seller1", password: "pass1", type: .seller, company: Company(companyName: "Компания1", region: "Москва", type: .meat)),
            User(username: "buyer1", password: "pass2", type: .buyer, company: Company(companyName: "Компания2", region: "Санкт-Петербург", type: .resale))
        ]
    }
}
