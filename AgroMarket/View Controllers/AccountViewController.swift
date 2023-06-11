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
    @IBOutlet weak var compLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // MARK: - Properties
    var currentUser: User!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    // MARK: - Private Methods
    private func updateUI() {
        compLabel.text = currentUser.company.name
        phoneNumberLabel.text = currentUser.phoneNumber
        emailLabel.text = currentUser.email
    }
}
