//
//  JPSenderVC.swift
//  JustPay
//
//  Created by Abhishek Thapliyal on 12/14/16.
//  Copyright © 2016 InHeap. All rights reserved.
//

import UIKit

class JPSenderVC: UIViewController {

    @IBOutlet weak var amountField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendButtonAction(_ sender: Any) {
        
        if (amountField.text?.isEmpty)! {
            
            let alertMsg : String = "INVALID AMOUNT"
            let alertVC = UIAlertController(title: "PAYMENT", message: alertMsg, preferredStyle: UIAlertControllerStyle.alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            show(alertVC, sender: self)
            return;
        }
        
        let manager = JPServerManager()
        let amount : NSString = NSString(format : "%@", amountField.text!)
//        manager.makePayment(amount: amount,  completion: { (json, error) in
//        
//        
//        
//        })
        self.change()
    }
    
    func change() -> Void {
        
        let reciverUserName : String = "1234567891"
        let amount : String = amountField.text! as String
//        let currentMinute = round(NSDate.date().timeIntervalSince1970() / (1000 * 60))
        
        let currentMinute : UInt64 = UInt64(round(Date().timeIntervalSince1970 / 60))
        print("CC :: \(currentMinute)")
        let amountInt : Int = (Int(amount)! * 100)
        
        print("AMOUNT ::",amount)

        let text = NSString(format: ":%@:%@:%d:%@:%lld:", JPUserDefaults.getUserName(),JPUserDefaults.getDeviceId(),amountInt,reciverUserName,currentMinute)
        
        print("TEXT : \(text)")
        
        let key = JPUserDefaults.getDeviceSecret()
        print("KEY : \(key)")
        let SHA256Object = JPSHA256HMAC()
        let token : NSString = SHA256Object.hashingSHA256HMAC(key as String!, andText: text as String!) as NSString  // sendt token to = receiver,
        
        // sender usernmae,device id,amount,token JSON form send to reciver app
        
        var dictionary = Dictionary<String,Any?>()
        dictionary["amount"] = amountInt
        dictionary["senderUserName"] = JPUserDefaults.getUserName()
        dictionary["senderDeviceId"] = JPUserDefaults.getDeviceId()
        dictionary["token"] = token
        
        
        
    }
    
}
