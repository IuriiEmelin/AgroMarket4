//
//  User.swift
//  AgroMarket
//
//  Created by Гамзат Гасанов on 07.06.2023.
//

import Foundation

struct User {
    let username: String
    let password: String
    let id: Int
    let type: UserType
    let company: Company
    let phoneNumber: String
    let email: String
}

enum UserType: String, CaseIterable {
    case buyer = "Покупатель"
    case seller = "Продавец"
}

struct Company {
    let name: String
    let region: String
}

extension User {
    static func getUsers() -> [User] {
        let usernames = DataStorage.shared.usernames
        let passwords = DataStorage.shared.passwords
        let userTypes = UserType.allCases.shuffled()
        let phoneNumbers = DataStorage.shared.phoneNumbers.shuffled()
        let emails = DataStorage.shared.emails.shuffled()
        
        
        var users: [User] = []
        let companies = Company.getCompanies()
        
       
        
        for index in 0..<usernames.count {
            let user = User(
                username: usernames[index],
                password: passwords[index],
                id: index + 1,
                type: userTypes[Int.random(in: 0...1)],
                company: companies[index],
                phoneNumber: phoneNumbers[index],
                email: emails[index]
            )
            users.append(user)
        }
        
        return users
    }
}

extension Company {
    static func getCompanies() -> [Company] {
        let companyNames = DataStorage.shared.companyNames.shuffled()
        let regions = DataStorage.shared.regions.shuffled()
        
        var companies: [Company] = []
        
        for index in 0..<companyNames.count {
            companies.append(
                Company(
                    name: companyNames[index],
                    region: regions[index]
                )
            )
        }
        
        return companies
    }
}
