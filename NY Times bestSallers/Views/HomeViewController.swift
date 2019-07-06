//
//  HomeViewController.swift
//  NY Times bestSallers
//
//  Created by Anthony Awuzie on 7/4/19.
//  Copyright © 2019 Anthony Awuzie. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    @IBOutlet weak var bookListTableView: UITableView!
    
    private var overview: NYTimesBestsellerOverview?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        guard let gitUrl = URL(string: URLConstants.BESTSELLER_LIST_OVERVIEW) else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let overview = try decoder.decode(NYTimesBestsellerOverview.self, from: data)
                print(overview.results.lists)

            } catch let err {
                print("Err", err)
            }
            }.resume()

        

    }
}

//extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }

//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return 
//    }
    
    
//}
