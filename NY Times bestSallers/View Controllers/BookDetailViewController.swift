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

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    

}
