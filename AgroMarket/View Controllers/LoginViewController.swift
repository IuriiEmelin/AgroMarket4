//
//  LoginViewController.swift
//  AgroMarket
//
//  Created by Алексей Турулин on 6/5/23.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    // MARK: - Private Properties
    private let users = User.getUsers()
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCategoryList" {
            guard let tabBarController = segue.destination as? TabBarController else { return }
            guard let currentUser = sender as? User else { return }
            
            tabBarController.currentUser = currentUser
            tabBarController.users = users
        }
    }
    
    // MARK: - Override Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func didTapForgotPassword() {
        guard let randomUser = users.randomElement() else { return }
        
        showAlert(
            title: "Восстановление пароля",
            message: "Обратитесь в службу поддержки за новым паролем...\n...\nНу ладно, так и быть скажу:\n\nusername - \(randomUser.username)\npassword - \(randomUser.password)"
        )
    }
    
    @IBAction func loginButtonTapped() {
        guard let username = usernameField.text, let password = passwordField.text else {
            showAlert(
                title: "Ошибка",
                message: "Введите логин и пароль"
            )
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
            performSegue(withIdentifier: "ShowCategoryList", sender: user)
        } else {
            showAlert(
                title: "Ошибка",
                message: "Неверный логин или пароль",
                textField: passwordField
            )
        }
    }
    
    // MARK: - Private Methods
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }

        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
