//
//  HomeViewController.swift
//  NY Times bestSallers
//
//  Created by Anthony Awuzie on 7/4/19.
//  Copyright © 2019 Anthony Awuzie. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableViewForBooks: UITableView!
    private var bestSellerBooks: NYTimesBestsellerOverview?
    private var allBooks: [Book] = []
    
    let bookDetaildentifier = "sendBookDetail"

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewForBooks.delegate = self
        tableViewForBooks.dataSource = self
        tableViewForBooks.backgroundColor = UIColor.lightGray
        
        tableViewForBooks.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        guard let url = URL(string: URLConstants.BESTSELLER_LIST_OVERVIEW) else { return }
        DispatchQueue.global(qos: .background).async {
            self.getData(url)
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isTranslucent = false
    }
    
    fileprivate func getData(_ url: URL) {
        
        URLSession.shared.dataTask(with: url, completionHandler: {
            (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let downloadedBooks = try decoder.decode(NYTimesBestsellerOverview.self, from: data)
                for(_, list) in downloadedBooks.results.lists.enumerated() {
                    self.allBooks.append(contentsOf: list.books)
                }
                DispatchQueue.main.async {
                    self.tableViewForBooks.reloadData()
                }
                
            } catch let err {
                print("Err", err)
            }
        }).resume()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == bookDetaildentifier {
            let bookDetail = segue.destination as! BookDetailViewController
            bookDetail.book = sender as? Book
        }
    }
    
    fileprivate func modifyTableCell(_ cell: HomeTableViewCell) {
        cell.layer.cornerRadius = 10
        let shadowPath2 = UIBezierPath(rect: cell.bounds)
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(3.0))
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowPath = shadowPath2.cgPath
        cell.layer.borderWidth = CGFloat(1)
    }
}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeTableViewCell
        
        modifyTableCell(cell)
        cell.author.text = allBooks[indexPath.row].author
        cell.bookTitle.text = allBooks[indexPath.row].title
        cell.bookImage.loadImage(using: (allBooks[indexPath.row].book_image ?? "test_img"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBook = allBooks[indexPath.row]
        performSegue(withIdentifier: bookDetaildentifier, sender: selectedBook)
        
    }
    
    
}


extension UIImageView {
    func loadImage(using urlString: String) {
        let url = URL(string: urlString)
        image = nil
        URLSession.shared.dataTask(with: url!, completionHandler: { (data,response,error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }).resume()
        
    }
}
