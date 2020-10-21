//
//  CinemaListController.swift
//  TabBarController-Basic
//
//  Created by Fenta on 2020/10/21.
//

import UIKit

class CinemaListController: UITableViewController {
    var list = [NSDictionary]()
    var startPoint = 0
    
    override func viewDidLoad() {
        loadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CinemaCell") as! CinemaCell
        cell.name?.text = obj["상영관명"] as? String
        cell.tel?.text = obj["연락처"] as? String
        cell.addr?.text = obj["소재지도로명주소"] as? String
        
        return cell
    }
    
    func loadData() {
        let reqURL = "http://swiftapi.rubypaper.co.kr:2029/theater/list"
        let sList = 100
        let type = "json"
        
        let urlObj =  URL(string: "\(reqURL)?s_page=\(startPoint)&s_list=\(sList)&type=\(type)")
        
        do {
            let stringData = try NSString(contentsOf: urlObj!, encoding: 0x80_000_422)
            let encodingData = stringData.data(using: String.Encoding.utf8.rawValue)
            
            do {
                let apiArray = try JSONSerialization.jsonObject(with: encodingData!, options: []) as? NSArray
                
                for obj in apiArray! {
                    list.append(obj as! NSDictionary)
                }
            } catch {
                alert("데이터 분석에 실패하였습니다")
            }
            
            startPoint += sList
        } catch {
            alert("데이터 로딩에 실패하였습니다")
        }
    }
}
