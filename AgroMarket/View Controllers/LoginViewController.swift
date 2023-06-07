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
    
    @IBAction func didTapForgotPassword() {
        showAlert(title: "Восстановление пароля", message: "Обратитесь в службу поддержки за новым паролем")
    }
    
    @IBAction func loginButtonTapped() {
        guard let username = usernameField.text, !username.isEmpty,
        let password = passwordField.text, !password.isEmpty else {
            showAlert(title: "Ошибка", message: "Введите логин и пароль")
            return
        }
        
        var foundUser: User?
        
        for currentUser in users {
            if currentUser.username == username && currentUser.password == password {
                foundUser = currentUser
                break
            }
        }
        
        if let user = foundUser {
            self.performSegue(withIdentifier: "ShowCategoryList", sender: user)
        } else {
            showAlert(title: "Ошибка", message: "Неверный логин или пароль")
        }
    }
    
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCategoryList",
           let destinationVC = segue.destination as? UINavigationController,
           let targetVC = destinationVC.viewControllers.first as? CategoryListViewController,
           let user = sender as? User {
            targetVC.currentUser = user
        }
    }
}
