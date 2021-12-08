//
//  WebService.swift
//  News
//
//  Created by Tolga on 5.11.2021.
//

import Foundation
import UIKit

 class Webservice {
    
    static let shared = Webservice()
    
    
    func loadNews() -> [News] {
        let urlString = "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fwww.ntv.com.tr%2Fson-dakika.rss"
        
        if let data = getData(from: urlString) {
            if let news = jsonDictionary(from: data)?["items"] {
                do {
                    let data = try JSONSerialization.data(withJSONObject: news, options: .fragmentsAllowed)
                    let decoder = JSONDecoder()
                    
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                    
                    let newsItems = try decoder.decode([News].self, from: data)
                    
                    let newsImage = newsItems.filter({ !$0.thumbnail.isEmpty })
                    
                    return newsImage.map { (news) -> News in
                        
                        let myNews = news
                        
                        return myNews
                    }

                    
                    
                }catch {
                    debugPrint(error)
                    return []
                }
            }
        }
        return []
    }
    
    
    private func getData(from urlString: String) -> Data? {
        guard let url = URL(string: urlString) else {
            fatalError("Couldn't load URL from provided string.")
        }
        
        do {
            return try Data(contentsOf: url)
        } catch {
            debugPrint("Couldn't load data from URL:\n\(error)")
            return nil
        }
    }
    
    private func jsonDictionary(from data: Data) -> [String : Any]? {
        do {
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            return (dictionary as? [String : Any])
        }catch {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
    
}

let NewsData = Webservice.shared.loadNews()




extension UIApplication {
    
    func open(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        self.open(url)
    }
}



extension DateFormatter {
    
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return formatter
    }()
}

