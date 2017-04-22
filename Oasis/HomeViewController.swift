//
//  HomeViewController.swift
//  Oasis
//
//  Created by Tiffany Zhou on 2/23/17.
//  Copyright © 2017 Turbo Ocelots. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class HomeViewController: UIViewController {



    @IBOutlet weak var view_water_avai: UIButton!
    
    @IBOutlet weak var view_historical: UIButton!
    
    @IBOutlet weak var submit_water_quality: UIButton!
    
    @IBOutlet weak var view_reports: UIButton!

    @IBOutlet weak var submit_water_source: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
