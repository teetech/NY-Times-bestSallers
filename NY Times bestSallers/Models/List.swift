//
//  Book.swift
//  NY Times bestSallers
//
//  Created by Anthony Awuzie on 7/6/19.
//  Copyright © 2019 Anthony Awuzie. All rights reserved.
//

import Foundation

struct List: Codable {
    let display_name: String
    let books: [Book]
    
    
    enum CodingKeys: CodingKey {
        case display_name
        case books
    }
}

struct Book: Codable {
    let title: String
    let author: String
    let book_image: String
    let rank: Int
    let primary_isbn10: String
    let publisher: String
    let description: String
    let rank_last_week: Int
    let weeks_on_list: Int
    let created_date: String
    let buy_links: [BuyLinks]
    
    enum CodingKeys: CodingKey {
        case title
        case author
        case book_image
        case rank
        case primary_isbn10
        case publisher
        case description
        case rank_last_week
        case weeks_on_list
        case created_date
        case buy_links
    }
}


struct BuyLinks: Codable {
    let name: String
    let url: String

    enum CodingKeys: CodingKey {
        case name
        case url
    }
}


