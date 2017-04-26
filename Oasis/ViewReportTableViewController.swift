//
//  ViewReportTableViewController.swift
//  Oasis
//
//  Created by Tiffany Zhou on 4/23/17.
//  Copyright © 2017 Turbo Ocelots. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewReportTableViewController: UITableViewController {
    var reports = [Report]()
    let ref = FIRDatabase.database().reference().child("report")
    var status: String = "inital"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchReport();
        self.tableView.delegate = self
        self.tableView.dataSource = self
        reports.append(Report(id: "dummy report", long: "fucking firebase", lat: "sucks", oCondition: "why doesn't", condition: "this work",type: "dsad",reporter: "dsada", virus: "fdsfs", contam: "sdfsfsf", reportType: " "))
        tableView.reloadData();
        status = "finish"
        
    }
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reports.count;
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reportCell", for: indexPath)
        let id = cell.viewWithTag(1)as! UILabel
        id.text=reports[indexPath.row].id
        
        let reporter = cell.viewWithTag(2) as! UILabel
        reporter.text = reports[indexPath.row].reporter
        
        let type = cell.viewWithTag(3) as! UILabel
        type.text = reports[indexPath.row].type
        
        let condition = cell.viewWithTag(4) as! UILabel
        condition.text = reports[indexPath.row].condition
        
        let virus = cell.viewWithTag(5) as! UILabel
        virus.text = reports[indexPath.row].virus
        
        let contam = cell.viewWithTag(6) as! UILabel
        contam.text = reports[indexPath.row].contam
        
        let lat = cell.viewWithTag(7) as! UILabel
        lat.text = reports[indexPath.row].lat
        
        let long = cell.viewWithTag(8) as! UILabel
        long.text = reports[indexPath.row].long
        
        let oCondition = cell.viewWithTag(9) as! UILabel
        oCondition.text = reports[indexPath.row].oCondition
        
        let reportType = cell.viewWithTag(10) as! UILabel
        reportType.text = reports[indexPath.row].reportType
        
        return cell
    }
    
    func fetchReport(){
        status = "fetch reports"
        ref.observe(.childAdded, with: { (snapshot) in
            if let value = snapshot.value as? NSDictionary {
                let long  = value["long"] as? String ?? ""
                let lat = value["lat"] as? String ?? ""
                let condition = value["condition"] as? String ?? ""
                let oCondition = value["oCondition"] as? String ?? ""
                let type = value["type"] as? String ?? ""
                let virus = value["virus"] as? String ?? ""
                let contam = value["contam"] as? String ?? ""
                let reporter = value["reporter"] as? String ?? ""
                let reportType = value["reportType"] as? String ?? ""
                let id = snapshot.key;
                self.reports.insert(Report(id: id,long: long,lat: lat,oCondition: oCondition,condition: condition,type: type,reporter: reporter,virus: virus,contam: contam,reportType: reportType), at: 0)
                self.tableView.reloadData();
            }
        })}
//        ref.observe(.value, with: { snapshot in
//            for child in snapshot.children {
//                let value = snapshot.value as? NSDictionary
//                    let long  = value?["long"] as? String ?? ""
//                    let lat = value?["lat"] as? String ?? ""
//                    let condition = value?["condition"] as? String ?? ""
//                          let oCondition = value?["oCondition"] as? String ?? ""
//                         let type = value?["type"] as? String ?? ""
//                        let virus = value?["virus"] as? String ?? ""
//                        let contam = value?["contam"] as? String ?? ""
//                         let reporter =  value?["reporter"] as? String ?? ""
//                         self.status = "entered"
//                          let id = snapshot.key;
//                          self.reports.insert(Report(id: id,long: long,lat: lat,oCondition: oCondition,condition: condition,type: type,reporter: reporter,virus: virus,contam: contam), at: 0)
//            }
//        })
//    }
//        FIRDatabase.setLoggingEnabled(true)
//        FIRDatabase.
//        ref.child("report").queryOrderedByKey().observeSingleEvent(of: .value, with: { snapshot in
//            for childSnapshot in snapshot.children {
//                if let value = snapshot.value as? NSDictionary {
//                                let long  = value["long"] as? String ?? ""
//                                let lat = value["lat"] as? String ?? ""
//                                let condition = value["condition"] as? String ?? ""
//                                let oCondition = value["oCondition"] as? String ?? ""
//                                let type = value["type"] as? String ?? ""
//                            let virus = value["virus"] as? String ?? ""
//                                let contam = value["contam"] as? String ?? ""
//                                let reporter = value["reporter"] as? String ?? ""
//                                self.status = "entered"
//                                let id = snapshot.key;
//                                self.reports.insert(Report(id: id,long: long,lat: lat,oCondition: oCondition,condition: condition,type: type,reporter: reporter,virus: virus,contam: contam), at: 0)
//
//                }}})}
    //            .observe(.childAdded, with: { snapshot in
//            if let value = snapshot.value as? NSDictionary {
//            let long  = value["long"] as? String ?? ""
//            let lat = value["lat"] as? String ?? ""
//            let condition = value["condition"] as? String ?? ""
//            let oCondition = value["oCondition"] as? String ?? ""
//            let type = value["type"] as? String ?? ""
//            let virus = value["virus"] as? String ?? ""
//            let contam = value["contam"] as? String ?? ""
//            let reporter = value["reporter"] as? String ?? ""
//            self.status = "entered"
//            let id = snapshot.key;
//            self.reports.insert(Report(id: id,long: long,lat: lat,oCondition: oCondition,condition: condition,type: type,reporter: reporter,virus: virus,contam: contam), at: 0)
//            }
//        
        
        
        
//        Ref.queryOrderedByKey().observeSingleEvent(of: .value ,with: { (snapshot) in
//            // Get user value
//            let value = snapshot.value as? NSDictionary
////            let long  = value?["long"] as? String ?? ""
////            let lat = value?["lat"] as? String ?? ""
////            let condition = value?["condition"] as? String ?? ""
////            let oCondition = value?["oCondition"] as? String ?? ""
////            let type = value?["type"] as? String ?? ""
////            let virus = value?["virus"] as? String ?? ""
////            let contam = value?["contam"] as? String ?? ""
////            let reporter =  value?["reporter"] as? String ?? ""
//         self.status = "entered"
////            let id = snapshot.key;
////            self.reports.insert(Report(id: id,long: long,lat: lat,oCondition: oCondition,condition: condition,type: type,reporter: reporter,virus: virus,contam: contam), 0)
            // ...
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    //}
}


