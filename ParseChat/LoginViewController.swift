//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Chavane Minto on 5/2/18.
//  Copyright © 2018 Abubakari Kitwala. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBAction func onScreenTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var usernameLabel: UITextField!
    
    @IBOutlet weak var PasswordLabel: UITextField!
    
    var alertController: UIAlertController!
    var alertError: String = ""
    
    @IBAction func onLogin(_ sender: Any) {
        
        let username = usernameLabel.text ?? ""
        let password = PasswordLabel.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
                self.alertError = error.localizedDescription
                self.isLoggedIn()
            } else {
                print("User logged in successfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
        
        
    }
    
    func isLoggedIn() {
        self.alertController = UIAlertController(title: "Login Error", message: alertError, preferredStyle: .alert)
        
        //try to connect again
        let tryAgain = UIAlertAction(title: "Try Again", style: .cancel) { (action) in
            self.usernameLabel.text = ""
            self.PasswordLabel.text = ""
        }
        
        // add action to alertController
        alertController.addAction(tryAgain)
        present(alertController, animated: true, completion: nil)
    }
    
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
