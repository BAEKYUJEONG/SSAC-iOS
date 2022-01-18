//
//  ViewController.swift
//  Firebase_Auth_Project
//
//  Created by 백유정 on 2022/01/17.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var varificationCodeTextField: UITextField!
    private var verifyID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
    
    @IBAction func sendButtonClicked(_ sender: UIButton) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumberTextField.text ?? "", uiDelegate: nil) { varification, error in
            if error == nil {
                self.verifyID = varification
            } else {
                print("Phone Varification Error: \(error.debugDescription)")
            }
        }
    }
    
    @IBAction func doneButtonClicked(_ sender: UIButton) {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verifyID ?? "", verificationCode: varificationCodeTextField.text ?? "")
        
        Auth.auth().signIn(with: credential) { success, error in
            if error == nil {
                print(success ?? "")
                print("User Sign in...")
            } else {
                print(error.debugDescription)
            }
        }
    }
    
}

