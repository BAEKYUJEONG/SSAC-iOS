//
//  ViewController.swift
//  ShoppingList
//
//  Created by 백유정 on 2021/11/02.
//

import UIKit
import RealmSwift

class ShoppingViewController: UIViewController {
    
    let localRealm = try! Realm()
    var tasks: Results<UserList>!
    
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet weak var shoppingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shoppingTableView.delegate = self
        shoppingTableView.dataSource = self
        
        tasks = localRealm.objects(UserList.self)
        print("테스크", tasks)
        print(localRealm.configuration.fileURL)
        
        addView.backgroundColor = .systemGray6
        addView.layer.cornerRadius = 12
        addTextField.backgroundColor = .systemGray6
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        shoppingTableView.reloadData()
    }
    
    @IBAction func keyboardReturnKeyClicked(_ sender: UITextField) {
        view.endEditing(true)
    }
    
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        let task = UserList(check: false,
                            list: addTextField.text!,
                            star: false)
        try! localRealm.write {
            localRealm.add(task)
            shoppingTableView.reloadData()
        }
    }
    
    @objc func checkButtonClicked(selectButton: UIButton) {
        print("체크 버튼 클릭")
        
        try! localRealm.write {
            if(tasks[selectButton.tag].check == false) {
                tasks[selectButton.tag].check = true
            } else {
                tasks[selectButton.tag].check = false
            }
            
            shoppingTableView.reloadRows(at: [IndexPath(row: selectButton.tag, section: 0)], with: .left)
        }
        
        print(tasks[selectButton.tag].check, selectButton.tag)
    }
    
    @objc func starButtonClicked(selectButton: UIButton) {
        print("즐겨찾기 버튼 클릭")
        
        try! localRealm.write {
            if(tasks[selectButton.tag].star == false) {
                tasks[selectButton.tag].star = true
            } else {
                tasks[selectButton.tag].star = false
            }
            
            shoppingTableView.reloadRows(at: [IndexPath(row: selectButton.tag, section: 0)], with: .fade)
        }
        
        print(tasks[selectButton.tag].star, selectButton.tag)
    }
    
}

extension ShoppingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = shoppingTableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.identifier) as? ShoppingTableViewCell else { return UITableViewCell() }
        
        let row = tasks[indexPath.row]
        
        cell.checkButton.tag = indexPath.row
        let checkImage = row.check ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "checkmark.square")
        cell.checkButton.setImage(checkImage, for: .normal)
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked(selectButton:)), for: .touchUpInside)
        
        cell.listLabel.text = row.list
        
        cell.starButton.tag = indexPath.row
        let starImage = row.star ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        cell.starButton.setImage(starImage, for: .normal)
        cell.starButton.addTarget(self, action: #selector(starButtonClicked(selectButton:)), for: .touchUpInside)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let row = tasks[indexPath.row]
        
        try! localRealm.write {
            localRealm.delete(row)
            shoppingTableView.reloadData()
        }
    }
}

