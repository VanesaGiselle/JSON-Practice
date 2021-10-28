//
//  ViewController.swift
//  JsonPractice
//
//  Created by Vanesa Korbenfeld on 28/10/2021.
//

import UIKit

class ViewController: UIViewController {
    var titleLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20).isActive = true
        titleLabel.numberOfLines = 0
        
        makeApiCall()
    }
    
    func makeApiCall() {
        let urlString:String = "https://newsapi.org/v2/everything?q=bitcoin&sortBy=publishedAt&apiKey=93b8b11c68d2442480ee3d735da6d1d1"
        
        let url = URL(string: urlString)
        
        guard let urlOk = url else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: urlOk) { (data, response, error) in
            
            if error == nil && data != nil {
                
                let decoder = JSONDecoder()
                
                do {
                    let newsFeed = try decoder.decode(NewsFeed.self, from: data!)
                    DispatchQueue.main.async {
                        self.titleLabel.text = newsFeed.articles[0].title
                    }
                }
                catch {
                    print("Error in JSON Parse")
                }
            }
        }
        
        dataTask.resume()
    }
}

