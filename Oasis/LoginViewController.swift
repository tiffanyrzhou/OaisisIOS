//
//  LoginViewController.swift
//  Oasis
//
//  Created by Tiffany Zhou on 2/23/17.
//  Copyright © 2017 Turbo Ocelots. All rights reserved.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {

    @IBOutlet weak var email_text: UITextField!
    @IBOutlet weak var passwordLogin_text: UITextField!
    @IBOutlet weak var status_label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        status_label.text=""
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func attemptLogin(_ sender: Any) {
        if email_text.hasText && passwordLogin_text.hasText{
            signIn();
        }
    }
    
    
    func signIn(){
        FIRAuth.auth()?.signIn(withEmail: email_text.text!, password: passwordLogin_text.text!) { (user, error) in
            if(error == nil) {
                self.performSegue(withIdentifier: "loginHome_segue", sender:self)
            }
            if (error != nil) {
                // an error occurred while attempting login
                if let errCode = FIRAuthErrorCode(rawValue: (error?._code)!) {
                    switch errCode {
                    case .errorCodeEmailAlreadyInUse:
                        self.status_label.text = "Email already in use"
                    case .errorCodeInvalidEmail:
                        self.status_label.text = "Email does not exist"
                    case .errorCodeWrongPassword:
                        self.status_label.text = "Password is invalid"
                    default:
                        self.status_label.text = "Login Failed"
                    }
                }
                
            }
        }
}
}



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

