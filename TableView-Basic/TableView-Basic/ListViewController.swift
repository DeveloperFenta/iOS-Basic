//
//  ListViewController.swift
//  TableView-Basic
//
//  Created by Fenta on 2020/10/15.
//

import UIKit

class ListViewController: UITableViewController {
    
    // Test Data
    var dataSet = [
        ("다크 나이트", "다크 나이트 영화 상세 설명", "2008-09-04", 8.04),
        ("호우시절", "호우시절 영화 상세 설명", "2014-11-13", 6.78),
        ("말할 수 없는 비밀", "말할 수 없는 비밀 영화 상세 설명", "2003-02-26", 6.23),
        ("친구", "친구 영화 상세 설명", "2012-10-04", 7.12)
    ]
    
    lazy var list: [MovieVO] = {
        var dataList = [MovieVO]()
        
        for (title, desc, opendate, rating) in self.dataSet {
            let mvo = MovieVO()
            mvo.title = title
            mvo.desc = desc
            mvo.opendate = opendate
            mvo.rating = rating
            
            dataList.append(mvo)
        }
        
        return dataList
    } ()
    
    override func viewDidLoad() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        
        cell.textLabel?.text = row.title
        cell.detailTextLabel?.text = row.desc
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("\(list[indexPath.row].title!)을 터치했습니다")
    }
}
