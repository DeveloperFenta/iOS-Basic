//
//  ListViewController.swift
//  TableView-CellHeight
//
//  Created by Fenta on 2020/10/16.
//

import UIKit

class ListViewController: UITableViewController {
    
    var list = [String]()
    
    override func viewDidLoad() {
        
    }
    
//MARK: If you want self-sizing cell
//    override func viewWillAppear(_ animated: Bool) {
//        self.tableView.estimatedRowHeight = 50
//        self.tableView.rowHeight = UITableView.automaticDimension
//    }
    
    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "글 입력",
                                      message: "글을 작성해주세요",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인",
                                     style: .default) { (_) in
            if let inputText = alert.textFields?[0].text {
                self.list.append(inputText)
                self.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "취소",
                                         style: .cancel)
        
        alert.addTextField {
            $0.placeholder = "내용 입력"
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell()
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        // 기본 높이 60 + 30 글자를 넘을때마다 + 20
        CGFloat(60 + (self.list[indexPath.row].count / 30) * 20)
    }
    
}
