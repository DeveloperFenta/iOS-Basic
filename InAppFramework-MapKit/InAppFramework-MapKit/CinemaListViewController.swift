//
//  CinemaListViewController.swift
//  InAppFramework-MapKit
//
//  Created by Fenta on 2020/10/22.
//

import UIKit

class CinemaListViewController: UITableViewController {
    var list = [NSDictionary]()
    var startPoint = 0
    
    override func viewDidLoad() {
        loadData()
    }
}

//MARK:- Scene Trans
extension CinemaListViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "windCinemaMap":
            let rowIndex = tableView.indexPath(for: sender as! CinemaCell)!.row
            (segue.destination as! CinemaDetailViewController).param = list[rowIndex]
        default:
            break
        }
    }
    
}

//MARK:- Implement UITableViewDelegate Protocol
extension CinemaListViewController {
    
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
    
}

//MARK:- Data Load Function
extension CinemaListViewController {
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

