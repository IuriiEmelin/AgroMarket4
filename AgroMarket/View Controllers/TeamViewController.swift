//
//  TeamViewController.swift
//  AgroMarket
//
//  Created by Алексей Турулин on 6/5/23.
//

import UIKit

final class TeamViewController: UIViewController {

    @IBOutlet weak var Yuriy: UIImageView!
    @IBOutlet weak var Gamzat: UIImageView!
    @IBOutlet weak var Gordey: UIImageView!
    @IBOutlet weak var Alexey: UIImageView!
    @IBOutlet weak var Daniil: UIImageView!
    
    override func viewDidLoad() {
        Yuriy.layer.cornerRadius = Yuriy.frame.width / 3
        Yuriy.clipsToBounds = true
        
        Gamzat.layer.cornerRadius = Gamzat.frame.width / 3
        Gamzat.clipsToBounds = true
        
        Gordey.layer.cornerRadius = Gordey.frame.width / 3
        Gordey.clipsToBounds = true
        
        Alexey.layer.cornerRadius = Alexey.frame.width / 3
        Alexey.clipsToBounds = true
        
        Daniil.layer.cornerRadius = Daniil.frame.width / 3
        Daniil.clipsToBounds = true
    }
}
