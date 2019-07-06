//
//  NYTimesBestsellerOverview.swift
//  NY Times bestSallers
//
//  Created by Anthony Awuzie on 7/4/19.
//  Copyright © 2019 Anthony Awuzie. All rights reserved.
//

import Foundation

struct NYTimesBestsellerOverview: Codable {
    var copyright: String
    var num_results: Int
    var status: String
}

enum CodingKeys: CodingKey {
    case copyright
    case num_results
    case status
}
