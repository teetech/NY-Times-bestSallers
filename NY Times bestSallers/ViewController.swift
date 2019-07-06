//
//  ViewController.swift
//  NY Times bestSallers
//
//  Created by Anthony Awuzie on 7/4/19.
//  Copyright © 2019 Anthony Awuzie. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    private var overview: NYTimesBestsellerOverview?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headers:HTTPHeaders = [
            "api-key": URLConstants.API_KEY
        ]
        
      

        Alamofire.request(URLConstants.BESTSELLER_LIST_OVERVIEW, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseJSON { (respose) in
            
            switch respose.result {
            case .success:
                if let validData = respose.data {
                    do {
                        let decoder = JSONDecoder()
                        self.overview = try decoder.decode(NYTimesBestsellerOverview.self, from: validData)
                        print(self.overview!.copyright)
                        
                    } catch {
                        print("error")
                    }
                }
            case .failure(let error):
                print("error")
            }
        }

}

}
