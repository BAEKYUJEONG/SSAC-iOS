//
//  ViewController.swift
//  AnniversaryCalculator
//
//  Created by 백유정 on 2021/10/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var dateImg01: UIImageView!
    @IBOutlet var dateImg02: UIImageView!
    @IBOutlet var dateImg03: UIImageView!
    @IBOutlet var dateImg04: UIImageView!
    
    @IBOutlet var dateAfter100: UILabel!
    @IBOutlet var dateAfter200: UILabel!
    @IBOutlet var dateAfter300: UILabel!
    @IBOutlet var dateAfter400: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        }
        
        dateViewSetting(dateImg01)
        dateViewSetting(dateImg02)
        dateViewSetting(dateImg03)
        dateViewSetting(dateImg04)
    }

    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        let format = DateFormatter()
        format.dateFormat = "yyyy년 MM월 dd일"
        
        let value = format.string(from: sender.date)
        print(value)
        
        // 100일 뒤: TimeInterval
        let after100Date = Date(timeInterval: 86400 * 100, since: sender.date)
        let value100 = format.string(from: after100Date)
        print(value100)
        dateAfter100.text = "\(value100)"
        
        // 200
        let after200Date = Date(timeInterval: 86400 * 200, since: sender.date)
        let value200 = format.string(from: after200Date)
        print(value200)
        dateAfter200.text = "\(value200)"
        
        // 300
        let after300Date = Date(timeInterval: 86400 * 300, since: sender.date)
        let value300 = format.string(from: after300Date)
        print(value300)
        dateAfter300.text = "\(value300)"
        
        // 400
        let after400Date = Date(timeInterval: 86400 * 400, since: sender.date)
        let value400 = format.string(from: after400Date)
        print(value400)
        dateAfter400.text = "\(value400)"
    }
    
    func dateViewSetting(_ img : UIImageView) {
        img.layer.cornerRadius = 10
    }
}

