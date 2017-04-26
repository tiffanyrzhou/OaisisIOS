//
//  MapViewController.swift
//  Oasis
//
//  Created by Tiffany Zhou on 4/25/17.
//  Copyright © 2017 Turbo Ocelots. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MapViewController: UIViewController {
    let ref = FIRDatabase.database().reference()
    var status: String = "";

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchReport();
        status = "finished";

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchReport() {
        status = "entered";
        ref.child("report").observe(.childAdded, with: { (snapshot) in
            self.status = "db sucess;"
            let value = snapshot.value as? NSDictionary
                let long  = value?["long"] as? String ?? ""
                let lat = value?["lat"] as? String ?? ""
                let condition = value?["condition"] as? String ?? ""
                let oCondition = value?["oCondition"] as? String ?? ""
                let type = value?["type"] as? String ?? ""
                 let virus = value?["virus"] as? String ?? ""
                let contam = value?["contam"] as? String ?? ""
                let reporter =  value?["reporter"] as? String ?? ""
                let id = snapshot.key;
            
        })
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
