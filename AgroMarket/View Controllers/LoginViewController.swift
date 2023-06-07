//
//  LoginViewController.swift
//  AgroMarket
//
//  Created by Алексей Турулин on 6/5/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var users: [User] = [
        User(username: "seller1", password: "pass1", type: .seller, company: Company(companyName: "Компания1", region: "Москва", type: .meat)),
        User(username: "buyer1", password: "pass2", type: .buyer, company: Company(companyName: "Компания2", region: "Санкт-Петербург", type: .resale))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameField.returnKeyType = .done
        passwordField.returnKeyType = .done
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
}
