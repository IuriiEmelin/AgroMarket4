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
        DataStorage.shared.users
    }
}
