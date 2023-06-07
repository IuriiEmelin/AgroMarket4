//
//  TabBarController.swift
//  AgroMarket
//
//  Created by Алексей Турулин on 6/5/23.
//

import UIKit

final class TabBarController: UITabBarController {

    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        transferData()
    }
    
    private func transferData() {
        guard let viewControllers else { return }
        guard let categoryNavigationController = viewControllers.first as? UINavigationController else { return }
        guard let categoryListVC = categoryNavigationController.topViewController as? CategoryListViewController else { return }
        
        let products = Product.getProducts()
        categoryListVC.products = products
        categoryListVC.user = user
    }
}
