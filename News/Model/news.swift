//
//  news.swift
//  News
//
//  Created by Tolga on 5.11.2021.
//

import Foundation


struct News: Codable {
    
    var title: String
    var thumbnail: String
    var link: String
    var pubDate: Date
}
