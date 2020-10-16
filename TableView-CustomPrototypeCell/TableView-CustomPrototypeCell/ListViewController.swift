//
//  ListViewController.swift
//  TableView-CustomPrototypeCell
//
//  Created by Fenta on 2020/10/16.
//

import UIKit

class ListViewController: UITableViewController {
    
    // Test Data
    var dataSet = [
        ("다크 나이트", "다크 나이트 영화 상세 설명", "2008-09-04", 8.04, "darknight.jpg"),
        ("호우시절", "호우시절 영화 상세 설명", "2014-11-13", 6.78, "rain.jpg"),
        ("말할 수 없는 비밀", "말할 수 없는 비밀 영화 상세 설명", "2003-02-26", 6.23, "secret.jpg"),
        ("친구", "친구 영화 상세 설명", "2012-10-04", 7.12, "friends.jpg")
    ]
    
    lazy var list: [MovieVO] = {
        var dataList = [MovieVO]()
        
        for (title, desc, opendate, rating, thumbnail) in self.dataSet {
            let mvo = MovieVO()
            mvo.title = title
            mvo.desc = desc
            mvo.opendate = opendate
            mvo.rating = rating
            mvo.thumbnail = thumbnail
            
            dataList.append(mvo)
        }
        
        return dataList
    } ()
    
    override func viewDidLoad() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = list[indexPath.row]
        
//MARK:   If you use tags to refer to objects in prototype cell
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
//
//        print("\(indexPath.row) 설정 중")
//        (cell.viewWithTag(101) as? UILabel)?.text = row.title
//        (cell.viewWithTag(102) as? UILabel)?.text = row.desc
//        (cell.viewWithTag(103) as? UILabel)?.text = row.opendate
//        (cell.viewWithTag(104) as? UILabel)?.text = "\(row.rating!)"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        cell.title?.text = row.title
        cell.desc?.text = row.desc
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        cell.thumbnail?.image = UIImage(named: row.thumbnail!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("\(list[indexPath.row].title!) 영화가 선택되었습니다.")
    }
}
