//
//  NYTimesBestsellerOverview.swift
//  NY Times bestSallers
//
//  Created by Anthony Awuzie on 7/4/19.
//  Copyright © 2019 Anthony Awuzie. All rights reserved.
//

import Foundation

struct NYTimesBestsellerOverview: Codable {
    let copyright: String
    let num_results: Int
    let status: String
    let results: Results
    
    enum CodingKeys: CodingKey {
        case copyright
        case num_results
        case status
        case results
    }
}

struct Results: Codable {
    let published_date: String?
    let published_date_description: String
    let lists: [List]
    
    enum CodingKeys: CodingKey {
        case published_date
        case published_date_description
        case lists
    }
}


