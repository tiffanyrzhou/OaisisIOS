//
//  WaterSourceViewController.swift
//  Oasis
//
//  Created by Tiffany Zhou on 4/22/17.
//  Copyright © 2017 Turbo Ocelots. All rights reserved.
//

import UIKit

class WaterSourceViewController: UIViewController {

    @IBOutlet weak var type_picker: UIPickerView!
    @IBOutlet weak var condition_picker: UIPickerView!
    @IBOutlet weak var lat: UITextField!
    @IBOutlet weak var long: UITextField!
    @IBOutlet weak var date_label: UILabel!
    @IBOutlet weak var report_number: UILabel!
    @IBOutlet weak var reporter_label: UILabel!
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
