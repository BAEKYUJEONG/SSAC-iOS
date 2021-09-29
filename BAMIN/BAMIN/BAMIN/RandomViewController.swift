//
//  RandomViewController.swift
//  BAMIN
//
//  Created by 백유정 on 2021/09/29.
//

import UIKit

class RandomViewController: UIViewController {
    
    @IBOutlet var randomLabel: UILabel!
    @IBOutlet var checkButton: UIButton!
    
    // 뷰컨트롤러 생명주기
    // 화면이 사용자에게 보이기 직전에 실행되는 기능 : 모서리 둥글게, 그림자 속성 등 스토리보드에서 구현하기 까다로운 UI를 미리 구현할 때 주로 사용
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomLabel.text = "안녕하세요\n반갑습니다"
        randomLabel.textAlignment = .center
        randomLabel.backgroundColor = .systemRed
        randomLabel.numberOfLines = 2
        randomLabel.font = UIFont.boldSystemFont(ofSize: 20)
        randomLabel.textColor = .blue
        randomLabel.layer.cornerRadius = 10
        // 테두리 색상, 둥글게 등 표현할 때 표현
        // 테두리 부분 바깥을 날리며 모양을 잡아줌
        randomLabel.clipsToBounds = true
        
        checkButton.backgroundColor = UIColor.magenta
        checkButton.setTitle("행운의 숫자를 뽑아보세요", for: .normal)
        checkButton.setTitle("뽑아 뽑아", for: .highlighted)
        checkButton.layer.cornerRadius = 10
        checkButton.setTitleColor(UIColor.white, for: .normal)
    }

    @IBAction func checkButtonClicked(_ sender: UIButton) {
        
        let number = Int.random(in: 1...100)
        
        randomLabel.text = "행운의 숫자는 \(number)입니다."
        //print("하이 하이")
    }
}
