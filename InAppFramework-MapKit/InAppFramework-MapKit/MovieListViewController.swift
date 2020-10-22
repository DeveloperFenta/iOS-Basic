//
//  MovieListViewController.swift
//  InAppFramework-MapKit
//
//  Created by Fenta on 2020/10/22.
//

import UIKit

class MovieListViewController: UITableViewController {
    
    var movieList = [MovieValueObject]()
    
    var page = 1
    
    @IBOutlet var moreBtn: UIButton!
    
    override func viewDidLoad() {
        loadData()
        page += 1
    }
    
    @IBAction func more(_ sender: Any) {
        loadData()
        tableView.reloadData()
        
        page += 1
    }
    
}

//MARK:- Scene Trans
extension MovieListViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "windMovieDetail":
            let rowIndex = tableView.indexPath(for: sender as! MovieCell)!.row
            (segue.destination as! MovieDetailViewController).mvo = movieList[rowIndex]
        default:
            break
        }
    }
    
}

//MARK:- Implement UITableViewDelegate Protocol
extension MovieListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = movieList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        cell.title.text = row.title
        cell.desc.text = row.desc
        cell.rating.text = "\(row.rating!)"
        DispatchQueue.main.async {
            cell.thumbnail.image = self.getThumbnailImg(indexPath.row)
        }
        
        return cell
    }
    
}

//MARK:- Data Load Function
extension MovieListViewController {
    
    func loadData() {
        let url = "http://115.68.183.178:2029/hoppin/movies?order=releasedateasc&count=10&page=\(page)&version=1&genreId="
        let apiURL = URL(string: url)!
        
        let apiData = try! Data(contentsOf: apiURL)
        
        do {
            let apiDic = try JSONSerialization.jsonObject(with: apiData, options: []) as! NSDictionary
            
            let hoppin = apiDic["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            for row in movie {
                let r = row as! NSDictionary
                
                let mvo = MovieValueObject()
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
    }
    
    func getThumbnailImg(_ index: Int) -> UIImage {
        let mvo = movieList[index]
        
        if let img = mvo.thumbnailImage {
            return img
        } else {
            mvo.thumbnailImage = UIImage(data: try! Data(contentsOf: URL(string: mvo.thumbnail!)!))
            
            return mvo.thumbnailImage!
        }
    }
    
}
