//
//  ProfileViewController.swift
//  DrinkWater
//
//  Created by 백유정 on 2021/10/08.
//

import UIKit
import TextFieldEffects

let nickname = UserDefaults.standard.string(forKey: "nickname")
var userNickname: String = nickname ?? "익명"

let rheight = UserDefaults.standard.float(forKey: "height")
let rweight = UserDefaults.standard.float(forKey: "weight")
var userRecommendDrinkWater: Float = (rheight + rweight) / 100 ?? 0

class ProfileViewController: UIViewController {
    
    @IBOutlet var saveBarButtonItem: UIBarButtonItem!
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var nicknameTextField: HoshiTextField!
    @IBOutlet var heightTextField: HoshiTextField!
    @IBOutlet var weightTextField: HoshiTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 65/255, green: 148/255, blue: 114/255, alpha: 1)
        
        navigationItem.backButtonTitle = "물 마시기"
        saveBarButtonItem.title = "저장"
        saveBarButtonItem.tintColor = .white
        nicknameLabel.text = "닉네임을 설정해주세요"
        nicknameLabel.textColor = .white
        heightLabel.text = "키(cm)를 설정해주세요"
        heightLabel.textColor = .white
        weightLabel.text = "몸무게(kg)를 설정해주세요"
        weightLabel.textColor = .white
        
        // 3. UserDefaults에 저장되어 있는 값 가져오기
        let nickname = UserDefaults.standard.string(forKey: "nickname")
        print(nickname)
        let height = UserDefaults.standard.string(forKey: "height")
        print(height)
        let weight = UserDefaults.standard.string(forKey: "weight")
        print(weight)
        
        // 4. 값을 표현하고자 하는 뷰 객체(텍스트필드)에 보여주기
        nicknameTextField.text = nickname
        heightTextField.text = height
        weightTextField.text = weight
    }
    
    @IBAction func KeyboardReturnKeyClicked(_ sender: UITextField) {
        view.endEditing(true)
    }
    
    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
        
        // 1. 저장하고자 하는 데이터를 가져오기
        let nicknameText = nicknameTextField.text ?? ""
        let heightText = heightTextField.text ?? ""
        let weightText = weightTextField.text ?? ""
        
        // 2. 데이터가 확인되었다면 UserDefaults에 Key를 만들고, Key에 데이터를 저장합니다.
        UserDefaults.standard.set(nicknameText, forKey: "nickname")
        UserDefaults.standard.set(heightText, forKey: "height")
        UserDefaults.standard.set(weightText, forKey: "weight")
    }
    
    
    
}
