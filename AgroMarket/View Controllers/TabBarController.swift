//
//  TabBarController.swift
//  AgroMarket
//
//  Created by Алексей Турулин on 6/5/23.
//

import UIKit

final class TabBarController: UITabBarController {

    // MARK: - Properties
    var users: [User]!
    var currentUser: User?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        transferData()
    }
    
    // MARK: - Private Properties
    private func transferData() {
        guard let viewControllers else { return }
        guard let categoryNavigationController = viewControllers.first as? UINavigationController else { return }
        guard let categoryListVC = categoryNavigationController.topViewController as? CategoryListViewController else { return }
        guard let accountVC = viewControllers.last as? AccountViewController else { return }
        
        categoryListVC.currentUser = currentUser
        categoryListVC.users = users
        accountVC.currentUser = currentUser
    }
}
