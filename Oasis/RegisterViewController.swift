//
//  RegisterViewController.swift
//  Oasis
//
//  Created by Tiffany Zhou on 2/22/17.
//  Copyright © 2017 Turbo Ocelots. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class RegisterViewController:UIViewController,UIPickerViewDataSource,UIPickerViewDelegate  {


    @IBOutlet weak var username_text: UITextField!
    @IBOutlet weak var password_text: UITextField!
    @IBOutlet weak var usertype_picker: UIPickerView!

    @IBOutlet weak var status_label: UILabel!
    @IBOutlet weak var register_button: UIButton!
    
    var user: User!
    let data = ["Worker","Reporter","Manager","Administrator"]
    let usersRef = FIRDatabase.database().reference(withPath: "users")
    let userInfoRef = FIRDatabase.database().reference(withPath: "usersInfo")
    var userTypeSelected: UserType = UserType.Worker;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.status_label.text = "intializing"
        
        self.usertype_picker.dataSource = self
        self.usertype_picker.delegate = self
        
        FIRAuth.auth()!.addStateDidChangeListener { auth, user in
            guard let user = user else { return }
            self.user = User(authData: user)
            let currentUserRef = self.usersRef.child(self.user.uid)
            currentUserRef.setValue(self.user.email)
            currentUserRef.onDisconnectRemoveValue()
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // picker view setup
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return data.count;
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        // Return a string from the array for this row.
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row == 0)
        {
           self.userTypeSelected = UserType.Worker
        }
        else if(row == 1)
        {
             self.userTypeSelected = UserType.Reporter
        }
        else if(row == 2)
        {
            self.userTypeSelected = UserType.Manager
        }
        else
        {
            self.userTypeSelected = UserType.Adminstator
        }
    }
    
    func signIn(){
        self.status_label.text = "entered sign in";
        FIRAuth.auth()?.signIn(withEmail: username_text.text!, password: password_text.text!) { (user, error) in
            // ...
            
            if(error == nil) {
                self.performSegue(withIdentifier: "registerHome_segue", sender:self)
            }
        }
    }

    @IBAction func attemptRegister(_ sender: UIButton) {
        if (username_text.hasText == false) {
            status_label.text = "Please enter an username before proceeding"
        } else if(password_text.hasText == false){
            status_label.text = "Please enter a password before proceeding"
        } else {
           FIRAuth.auth()?.createUser(withEmail: username_text.text!, password: password_text.text!) { (user, error) in
            if(error == nil){
                let newUser = User(authData: user!,userType: self.userTypeSelected)
                let newUserRef = self.userInfoRef.child(self.user.uid)
                let UserData: Dictionary<String,Any> = ["uid": newUser.uid,
                                                        "email": newUser.email,
                                                        "usertype": newUser.userType.description,
                                                        "title": newUser.title,
                                                        "name": newUser.name,
                                                        "homeaddress": newUser.home,
                                                        "phone" : newUser.phone]
                newUserRef.setValue(UserData)
                self.signIn();
            }
            if (error != nil) {
                if let errCode = FIRAuthErrorCode(rawValue: (error?._code)!) {
                    
                    switch errCode {
                    case .errorCodeEmailAlreadyInUse:
                        self.status_label.text = "Email already in use"
                    case .errorCodeInvalidEmail:
                        self.status_label.text = "Email does not exist"
                    case .errorCodeWeakPassword:
                        self.status_label.text = "Password is invalid"
                    default:
                        self.status_label.text = "Register Failed"
                }

                }
            }
            }
        }
    }
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
