//
//  ViewController.swift
//  TaskR
//
//  Created by LetMeCall Corp on 27/03/19.
//  Copyright © 2019 LetMeCall Corp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
 
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var searchArray = [String]()
    var searching = false
    
    var URLSObj:URLSession?
    var URLReq:URLRequest?
    var URLSDataTask:URLSessionDataTask?
    
    var nameArry = ["Alivelu Developer","Anitha Developer","Rajesh Developer","madhukar Developer","Ramarao Developer","Ravi Developer","Suresh Tester","Priyanka Developer","Nithin Developer","Prakash Developer"]
    
    var delArry = ["Develop","testing",]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
    tableView.register(UINib.init(nibName: "DeveloperCell", bundle: nil), forCellReuseIdentifier: "DeveloperCell")
        
//        tableView.register(UINib.init(nibName:DeveloperCell))
        
        // Do any additional setup after loading the view, typically from a nib.
        //Do any additional setup after loading the view typica
        
      
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeveloperCell", for: indexPath) as! DeveloperCell
        cell.nameLbl.text = self.nameArry[indexPath.row]
        var value = "bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI3YTU2ZmQ3MS00ZTBlLTQ1ODYtOTk2MC01ZGM1NWVjNDhjODAiLCJzdWIiOiJjaGFuZHJhLnRoaW5rMzYwQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJjaGFuZHJhLnRoaW5rMzYwQGdtYWlsLmNvbSIsInVzZXJpZCI6ImNoYW5kcmEudGhpbmszNjBAZ21haWwuY29tIiwicGdpZCI6IjEiLCJleHAiOjE1NzE4MjcwNzgsImlzcyI6Imh0dHBzOi8vcWEyLnRlbGVkZW50aXguY29tIiwiYXVkIjoiaHR0cHM6Ly9xYTIudGVsZWRlbnRpeC5jb20ifQ.aFb5NAuN-tCPa8uhXmjjw5oYn8cZQ0ptIzppnsHlqac"
        
//       let headers = ["Authorization":token,"Content-Type": "application/json"]
        
        
         let headers = ["Authorization":value,"Content-Type": "application/json"]
        
        let loginURL = "https://qa2.teledentix.com/api/networks/connections?ItemPerPage=5&currentPageNum=1&needDetails=true"
        
        let needDetails:Bool = true
       
        let parameters: Parameters=[
            "ItemPerPage":cell.nameLbl.text!,
            "currentPageNum":cell.descriptionLbl.text!,
            "needDetails":needDetails]

//        let parameters: Parameters=[
//            "ItemPerPage":"5",
//            "currentPageNum":"1",
//            "needDetails":"true"]
        
        
        
        var request = URLRequest(url: NSURL.init(string: loginURL) as! URL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 30 // 10 secs
        let postString = "ItemPerPage=\(cell.nameLbl.text!)&currentPageNum=\(cell.descriptionLbl.text!)&needDetails=\(needDetails)"
       request.httpBody = postString.data(using: .utf8)
        Alamofire.request(request).responseJSON {
            response in
            
        }
        
//        Alamofire.request(loginURL, method: .get, parameters: parameters,encoding: JSONEncoding.default, headers: headers).responseJSON {response in
//            DispatchQueue.main.async {
//                
//                print(response)
//
//            }
//            
//            if response.result.isSuccess
//            {
//                if let responsee = response.result.value as? [String: Any] {
//                    print(responsee)
//                }
//            }
//            else {
//                print("failure")
//            }
//    
//            }
        return cell

    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 150
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchArray = self.nameArry.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        self.searching = true
        self.searchBar.delegate = self
        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //        self.tableView.isHidden = true
        self.searching = false
        self.searchBar.text = "Search..."
        self.tableView.reloadData()
        
    }
    
}
    


//
//    Key :  Authorization
//
//    value : bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI3YTU2ZmQ3MS00ZTBlLTQ1ODYtOTk2MC01ZGM1NWVjNDhjODAiLCJzdWIiOiJjaGFuZHJhLnRoaW5rMzYwQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJjaGFuZHJhLnRoaW5rMzYwQGdtYWlsLmNvbSIsInVzZXJpZCI6ImNoYW5kcmEudGhpbmszNjBAZ21haWwuY29tIiwicGdpZCI6IjEiLCJleHAiOjE1NzE4MjcwNzgsImlzcyI6Imh0dHBzOi8vcWEyLnRlbGVkZW50aXguY29tIiwiYXVkIjoiaHR0cHM6Ly9xYTIudGVsZWRlbnRpeC5jb20ifQ.aFb5NAuN-tCPa8uhXmjjw5oYn8cZQ0ptIzppnsHlqac
