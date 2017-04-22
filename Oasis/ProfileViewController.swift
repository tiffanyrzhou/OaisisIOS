//
//  ProfileViewController.swift
//  Oasis
//
//  Created by Tiffany Zhou on 4/21/17.
//  Copyright © 2017 Turbo Ocelots. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ProfileViewController: UIViewController {
    
    let userInfoRef = FIRDatabase.database().reference(withPath: "usersInfo")
    var user: User!
    @IBOutlet weak var name_text: UITextField!
    @IBOutlet weak var email_label: UILabel!
    @IBOutlet weak var welcome_label: UILabel!

    @IBOutlet weak var title_text: UITextField!
    @IBOutlet weak var number_text: UITextField!
    @IBOutlet weak var home_text: UITextField!
    @IBOutlet weak var usertype_label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcome_label.text = "Waiting For Database";
        FIRAuth.auth()!.addStateDidChangeListener { auth, user in
            guard let user = user else { return }
            self.user = User(authData: user)
        }
        testing();
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testing() {
    self.welcome_label.text = "testing"
    pullProfile()
    }
    
    
    @IBAction func save_profile(_ sender: UIButton) {
        pushProfile();
        pullProfile();
        
    }
    
    func pullProfile(){
        self.welcome_label.text = "Profile";
        let userID = FIRAuth.auth()?.currentUser?.uid
        userInfoRef.child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            
            let email = value?["email"] as? String ?? ""
            self.email_label.text = email;
            let name = value?["name"] as? String ?? ""
            self.welcome_label.text = "Welcome, " + name;
            self.name_text.text = name;
            let usertype = value?["usertype"] as? String ?? ""
            self.usertype_label.text = usertype;
            let title = value?["title"] as? String ?? ""
            self.title_text.text = title;
            let home = value?["home"] as? String ?? ""
            self.home_text.text = home;
            let phone = value?["phone"] as? String ?? ""
            self.number_text.text = phone;
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    
    
    func pushProfile(){
        let userID = FIRAuth.auth()?.currentUser?.uid
        let UserData: Dictionary<String,String> = [
            "name": self.name_text.text!,
            "title": self.title_text.text!,
            "home": self.home_text.text!,
            "phone": self.number_text.text!]
        userInfoRef.child(userID!).updateChildValues(UserData)
        pullProfile()
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
