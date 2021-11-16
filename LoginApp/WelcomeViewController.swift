//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Arthur Lee on 09.07.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLab: UILabel!
    var user: String!
    
    private let primaryColor = UIColor(red: 200/255, green: 100/255, blue: 120/255, alpha: 1)
    private let secondaryColor = UIColor(red: 100/255, green: 150/255, blue: 240/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        welcomeLab.text = "Welcome, \(user ?? "Noname")!"
        
        

        // Do any additional setup after loading the view.
    }
    
}
extension WelcomeViewController {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor,bottomColor.cgColor]
        gradient.locations = [0.0,1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.startPoint = CGPoint(x: 0, y:1)
        view.layer.insertSublayer(gradient, at: 0)
    }
}
