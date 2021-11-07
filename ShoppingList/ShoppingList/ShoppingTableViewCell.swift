//
//  ShoppingTableViewCell.swift
//  ShoppingList
//
//  Created by 백유정 on 2021/11/04.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {

    static let identifier = "ShoppingTableViewCell"
    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
