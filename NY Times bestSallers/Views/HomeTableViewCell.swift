//
//  HomeTableViewCell.swift
//  NY Times bestSallers
//
//  Created by Anthony Awuzie on 7/6/19.
//  Copyright © 2019 Anthony Awuzie. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    
    @IBOutlet weak var tableCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bookImage.layer.borderWidth = 1
    }
}
