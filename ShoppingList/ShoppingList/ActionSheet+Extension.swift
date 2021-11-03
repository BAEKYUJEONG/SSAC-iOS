//
//  ActionSheet+Extension.swift
//  ShoppingList
//
//  Created by 백유정 on 2021/11/07.
//

import Foundation
import UIKit

extension UIViewController {
    func showAction(checkAction: @escaping () -> (), starAction: @escaping () -> (), titleAction: @escaping () -> ()) {
        let action = UIAlertController(title: "정렬", message: "정렬하고 싶은 기준 선택", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let check = UIAlertAction(title: "할 일 기준으로 정렬", style: .default) { _ in
            checkAction()
        }
        let star = UIAlertAction(title: "즐겨찾는 순으로 정렬", style: .default) { _ in
            starAction()
        }
        let title = UIAlertAction(title: "제목 순으로 정렬", style: .default) { _ in
            titleAction()
        }
        
        action.addAction(cancel)
        action.addAction(check)
        action.addAction(star)
        action.addAction(title)
        
        self.present(action, animated: true) {
            print("Here is ActionSheet")
        }
    }
}
