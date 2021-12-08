//
//  ViewController.swift
//  News
//
//  Created by Tolga on 5.11.2021.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.refresh, target: self, action: #selector(reflesh))
            
    }
    
    @objc func reflesh() {
        tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let news = NewsData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.titleLabel.text = news.title
        cell.thumbnailImageView.sd_setImage(with: URL(string: news.thumbnail))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let publishDateString = dateFormatter.string(from: news.pubDate)
        
        cell.publishDateLabel.text = publishDateString.uppercased()
        
        
   
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedNews = NewsData[indexPath.row]
        let newsUrl = selectedNews.link
        
        UIApplication.shared.open(urlString: newsUrl)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    


}



