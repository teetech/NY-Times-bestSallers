//
//  BookDetailViewController.swift
//  NY Times bestSallers
//
//  Created by Anthony Awuzie on 7/31/19.
//  Copyright © 2019 Anthony Awuzie. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    var selectedBook: Book?
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var publisher: UILabel!
    @IBOutlet weak var weekInList: UILabel!
    @IBOutlet weak var createdDate: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        config(book: selectedBook!)
    }
    
    fileprivate func config(book: Book) {
        bookTitle.text = book.title
        author.text = "by " + book.author
        rank.text = String(book.rank)
        publisher.text = book.publisher
        weekInList.text = String(book.weeks_on_list)
        createdDate.text = book.created_date
        bookImage.loadImage(using: (book.book_image ?? "test_img"))
    }
}
