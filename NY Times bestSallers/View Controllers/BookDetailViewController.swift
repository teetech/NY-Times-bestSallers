//
//  BookDetailViewController.swift
//  NY Times bestSallers
//
//  Created by Anthony Awuzie on 7/31/19.
//  Copyright © 2019 Anthony Awuzie. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    var book: Book?
    @IBOutlet weak var bookTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        bookTitle.text = book?.title
        
    }
}
