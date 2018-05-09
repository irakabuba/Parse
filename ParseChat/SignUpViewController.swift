//
//  SignUpViewController.swift
//  ParseChat
//
//  Created by Chavane Minto on 5/2/18.
//  Copyright © 2018 Abubakari Kitwala. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UITextField!
    
    @IBOutlet weak var emailLabel: UITextField!
    
    @IBOutlet weak var passwordLabel: UITextField!
    
    var alertController: UIAlertController!
    var alertError: String = ""
    
    @IBAction func onScreenTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerNewUser(_ sender: Any) {
        //new user object created using Parse
        let newUser = PFUser()
        
        //Set user Properties and assign values using text inputs
        newUser.username = usernameLabel.text
        newUser.email = emailLabel.text
        newUser.password = passwordLabel.text
        
        // call sign up function on the object
        
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error{
                print("User log in failed: \(error.localizedDescription)")
                self.alertError = error.localizedDescription
                self.isSignedUp()
            } else {
                print("User logged in successfully")
                self.dismiss(animated: true, completion: nil)
                
            }
        }
        
    }
    
    func isSignedUp() {
        self.alertController = UIAlertController(title: "Sign Up Error", message: alertError, preferredStyle: .alert)
        
        //try to connect again
        let tryAgain = UIAlertAction(title: "Try Again", style: .cancel) { (action) in
            self.usernameLabel.text = ""
            self.passwordLabel.text = ""
            self.emailLabel.text = ""
        }
        
        // add action to alertController
        alertController.addAction(tryAgain)
        present(alertController, animated: true, completion: nil)
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
