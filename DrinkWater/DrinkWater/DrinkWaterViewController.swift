//
//  DrinkWaterViewController.swift
//  DrinkWater
//
//  Created by 백유정 on 2021/10/08.
//

import UIKit
import TextFieldEffects

class DrinkWaterViewController: UIViewController {
    
    var totalWaterAmount = 0
    
    @IBOutlet var profileBarButtonItem: UIBarButtonItem!
    @IBOutlet var refreshBarButtonItem: UIBarButtonItem!
    
    @IBOutlet var waterAmountLabel: UILabel!
    @IBOutlet var waterPercentLabel: UILabel!
    
    @IBOutlet var plantImageView: UIImageView!
    @IBOutlet var waterTextField: HoshiTextField!
    @IBOutlet var recommendDrinkWaterLabel: UILabel!
    @IBOutlet var drinkWaterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userPercent = Int((Double(totalWaterAmount) / Double (userRecommendDrinkWater * 1000)) * 100)
        
        view.backgroundColor = UIColor(red: 65/255, green: 148/255, blue: 114/255, alpha: 1)
        
        navigationItem.title = "물 마시기"
        profileBarButtonItem.tintColor = .white
        refreshBarButtonItem.tintColor = .white
        
        waterAmountLabel.text = String(totalWaterAmount)+"ml"
        waterAmountLabel.textColor = .white
        waterPercentLabel.text = "목표의 \(userPercent)%"
        waterPercentLabel.textColor = .white
        
        recommendDrinkWaterLabel.text = "\(userNickname)님의 하루 물 권장 섭취량은 \(userRecommendDrinkWater)L 입니다."
        recommendDrinkWaterLabel.textAlignment = .center
        recommendDrinkWaterLabel.textColor = .white
        drinkWaterButton.backgroundColor = .white
        drinkWaterButton.tintColor = .black
    }

    //didEndOnExit
    @IBAction func keyboardReturnKeyClicked(_ sender: UITextField) {
        view.endEditing(true)
    }
    
    @IBAction func drinkButtonClicked(_ sender: UIButton) {
        guard let water = Int(waterTextField.text!)
        else{
            return
        }
        print(water)
        
        totalWaterAmount += water
        print(totalWaterAmount)
        
        updateStatus()
    }
    
    @IBAction func refreshButtonClicked(_ sender: UIBarButtonItem) {
        totalWaterAmount = 0
        updateStatus()
    }
    
    func updateStatus(){
        waterAmountLabel.text = String(totalWaterAmount)+"ml"
        
        let userPercent = Int((Double(totalWaterAmount) / Double (userRecommendDrinkWater * 1000)) * 100)
        waterPercentLabel.text = "목표의 \(userPercent)%"
        if userPercent < 10 {
            plantImageView.image = UIImage(named: "1-1")
        }else if userPercent >= 10 && userPercent < 20 {
            plantImageView.image = UIImage(named: "1-2")
        }else if userPercent >= 20 && userPercent < 30 {
            plantImageView.image = UIImage(named: "1-3")
        } else if userPercent >= 30 && userPercent < 40 {
            plantImageView.image = UIImage(named: "1-4")
        }else if userPercent >= 40 && userPercent < 50 {
            plantImageView.image = UIImage(named: "1-5")
        }else if userPercent >= 50 && userPercent < 60 {
            plantImageView.image = UIImage(named: "1-6")
        }else if userPercent >= 60 && userPercent < 70 {
            plantImageView.image = UIImage(named: "1-7")
        }else if userPercent >= 70 && userPercent < 80 {
            plantImageView.image = UIImage(named: "1-8")
        }else if userPercent >= 80 {
            plantImageView.image = UIImage(named: "1-9")
        }
    }
}

