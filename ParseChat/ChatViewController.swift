//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Kyle Sit on 2/23/17.
//  Copyright © 2017 Kyle Sit. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {
   
    @IBOutlet weak var messageTextField: UITextField!    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newMessage(_ sender: Any) {
        let message = PFObject(className:"Message")
        message["text"] = messageTextField.text
        message.saveInBackground { (success: Bool, error: Error?) in
            if (error != nil) {
                if( self.messageTextField.text == "" ) {
                    let alertController = UIAlertController(title: "Invalid", message: "The required fields is empty", preferredStyle: .alert)
                    
                    // create an OK action
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                }
            }
            else {
                print(self.messageTextField.text)
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

}
