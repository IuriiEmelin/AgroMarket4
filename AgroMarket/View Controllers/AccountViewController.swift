//
//  AccountViewController.swift
//  AgroMarket
//
//  Created by Алексей Турулин on 6/5/23.
//  Modified by Daniil Chupin on 6/10/23.
//

import UIKit

final class AccountViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    // TODO: - пока в качестве заглушки
    let person = Person(name: "Vasya",
                        surname: "Petrov",
                        email: "test@test.ru",
                        phoneNumber: "+7 123 456 1234",
                        age: 20,
                        company: "TopGear")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullNameLabel.text = person.fullName
        emailLabel.text = person.email
        phoneLabel.text = person.phoneNumber
    }

}

struct Person {
    let name: String
    let surname: String
    let email: String
    let phoneNumber: String
    let age: Int
    let company: String
    
    var fullName: String {
        name + surname
    }
}
