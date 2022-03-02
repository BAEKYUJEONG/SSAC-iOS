//
//  LoginViewController.swift
//  SeSACWeek23
//
//  Created by 백유정 on 2022/03/02.
//

import UIKit

// id. @ 유무, 6자리 이상
// pw. 6자리 이상 10자리 미만
// check. pw와 같은지
class LoginViewController: UIViewController {
    
    var user = User(email: "", password: "", check: "")
    var validator = Validator()

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        user = User(email: idTextField.text!, password: passwordTextField.text!, check: checkTextField.text!)
        
        if validator.isValidID(id: user.email) && validator.isValidPassword(password: user.password) && validator.isEqualPassword(password: user.password, check: user.check) {
            print("성공")
        } else {
            print("실패")
        }
    }
    
/*
    func isValidID() -> Bool {
        guard let id = idTextField.text else {
            return false
        }
        return id.contains("@") && id.count >= 6
    }
    
    func isValidPassword() -> Bool {
        guard let password = passwordTextField.text else {
            return false
        }
        return password.count >= 6 && password.count < 10
    }
    
    func isEqualPassword() -> Bool {
        guard let password = passwordTextField.text, let check = checkTextField.text else {
            return false
        }
        return password == check
    }
*/

}
