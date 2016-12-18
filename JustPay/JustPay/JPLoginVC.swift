//
//  JPLoginVC.swift
//  JustPay
//
//  Created by Abhishek Thapliyal on 11/21/16.
//  Copyright © 2016 InHeap. All rights reserved.
//

import UIKit


class JPLoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var emailId: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    @IBAction func loginAction(_ sender: Any) {
        
        if ((emailId.text?.isEmpty)! || (password.text?.isEmpty)!) {

            let alertMsg : String = "INVALID CREDENTIALS"
            let alertVC = UIAlertController(title: "Authentication", message: alertMsg, preferredStyle: UIAlertControllerStyle.alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            show(alertVC, sender: self)
            return;
        }
        
        let jpUser = JPUser()
        jpUser.userName = emailId.text!
        jpUser.password = password.text!
        
        JPUserDefaults.setUserName(username: emailId.text!)
        JPUserDefaults.setPassword(password: password.text!)
        
        let serverManager = JPServerManager()
        serverManager.userlogin(jpUser: jpUser, completion: { (json, error) in
        
            if (error == nil) {
                
                let storyBoard : UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
                let senderVC : UIViewController = storyBoard.instantiateViewController(withIdentifier: "senderVC")
                OperationQueue.main.addOperation {
                    self.present(senderVC, animated: true, completion: nil)
                }
                
            }
        })
        
//        serverManager.userRegistration(user: jpUser, completion: { (json, error) in
//            
//            if (error == nil) {
//                
//                let storyBoard : UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
//                let senderVC : UIViewController = storyBoard.instantiateViewController(withIdentifier: "senderVC")
//        OperationQueue.main.addOperation {
//            self.present(senderVC, animated: true, completion: nil)
//        }
//            }
//        })
        
//        let SHA256Object = JPSHA256HMAC()
//        SHA256Object.hashingSHA256HMAC("abc", andText: "123")

        
    }
    
}

