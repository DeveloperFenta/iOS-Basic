//
//  ListViewController.swift
//  Network-RESTAPI
//
//  Created by Fenta on 2020/10/18.
//

import UIKit

class ListViewController: UITableViewController {
    
    var movieList = [MovieVO]()
    var page = 1
    
    @IBOutlet var moreBtn: UIButton!
    
    override func viewDidLoad() {
        loadDate()
    }
    
    @IBAction func more(_ sender: Any) {
        loadDate()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = movieList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! ListCell
        
        cell.title?.text = row.title
        cell.desc?.text = row.desc
        cell.rating?.text = "\(row.rating!)"
        
        let url = URL(string: row.thumbnail!)!
        let imageDate = try! Data(contentsOf: url)
        cell.imageView?.image = UIImage(data: imageDate)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ListViewController {
    func loadDate() {
        let url = "http://115.68.183.178:2029/hoppin/movies?order=releasedateasc&count=10&page=\(page)&version=1&genreId="
        let apiURL = URL(string: url)!
        
        let apiData = try! Data(contentsOf: apiURL)
        
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apiData, options: []) as! NSDictionary
            
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            for row in movie {
                let r = row as! NSDictionary
                
                let mvo = MovieVO()
                mvo.title = r["title"] as? String
                mvo.desc = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = (r["ratingAverage"] as! NSString).doubleValue
                
                movieList.append(mvo)
            }
            
            let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
            if movieList.count >= totalCount {
                moreBtn.isHidden = true
            }
            
        } catch {
            NSLog("Parse Error")
        }
        
        page += 1
    }
}
