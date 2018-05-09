//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Chavane Minto on 5/2/18.
//  Copyright © 2018 Abubakari Kitwala. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet weak var chatMessageField: UITextField!
    
    @IBAction func onPostMessage(_ sender: Any) {
        
        //Create Parse Object for the chat message with the className ID
        let chatMessage = PFObject(className: "Message_fbuJuly2017")
        
        // Store text entered in text field into the object
        chatMessage["text"] = chatMessageField.text ?? ""
        
        //save the message to Parse database, or print any errors
        chatMessage.saveInBackground { (success: Bool, error: Error?) in
            if success {
                print("The message was saved!")
                self.chatMessageField.text = ""
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        }
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
