//
//  HomeViewController.swift
//  NY Times bestSallers
//
//  Created by Anthony Awuzie on 7/4/19.
//  Copyright © 2019 Anthony Awuzie. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewForBooks: UITableView!
    private var bestSellerBooks: NYTimesBestsellerOverview?

    
    
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
    
    fileprivate func getData(_ url: URL) {
        
        URLSession.shared.dataTask(with: url, completionHandler: {
            (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let downloadedBooks = try decoder.decode(NYTimesBestsellerOverview.self, from: data)
                self.bestSellerBooks = downloadedBooks
                DispatchQueue.main.async {
                    self.tableViewForBooks.reloadData()
                }
                
            } catch let err {
                print("Err", err)
            }
        }).resume()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
//            (bestSellerBooks?.results.lists.count)!
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeTableViewCell
        
        modifyTableCell(cell)
        cell.author.text = bestSellerBooks?.results.lists[indexPath.section + 3].books[indexPath.row].author
        cell.bookTitle.text = bestSellerBooks?.results.lists[indexPath.section + 3].books[indexPath.row].title
        cell.bookImage.loadImage(using: (bestSellerBooks?.results.lists[indexPath.section + 3].books[indexPath.row].book_image ?? "test_img"))
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
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
