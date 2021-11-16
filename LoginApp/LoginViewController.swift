//
//  ViewController.swift
//  LoginApp
//
//  Created by Arthur Lee on 09.07.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameText: UITextField!
    @IBOutlet var userPasswordText: UITextField!
    
    private let userName = "User"
    private let userPassword = "Password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Signin" else { return }
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.user = userNameText.text
        
    }
    @IBAction func signInPressed() {
        guard userNameText.text == userName,
              userPasswordText.text == userPassword
        else { showAlert(title: "Invalid login or password!", message: "Please, try again!", textField: userPasswordText)
            return
        }
        
        performSegue(withIdentifier: "Signin", sender: nil)
    }
  
    @IBAction func forgetPasswordPressed() {
        showAlert(title: "Ops!", message: "Your password is \(userPassword)!")
    }
    
    @IBAction func forgotNamePressed () {
        showAlert(title: "Ops!", message: "Your name is \(userName)!")
    }
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameText.text = nil
        userPasswordText.text = nil
    }
}

extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in textField?.text = nil }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameText {
            textField.resignFirstResponder()
            userPasswordText.becomeFirstResponder()
        } else {
            signInPressed()
        }
        return true
    }
}
    
    

