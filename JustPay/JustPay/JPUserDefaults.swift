//
//  JPUserDefaults.swift
//  JustPay
//
//  Created by Abhishek Thapliyal on 12/6/16.
//  Copyright © 2016 InHeap. All rights reserved.
//

import UIKit

var KEY_PREFIX : String = "com.justpay"
var USERNAME : String = "com.justpay.username"
var PASSWORD : String = "com.justpay.password"
var EMAIL : String = "com.justpay.email"
var FIRSTNAME : String = "com.justpay.firstname"
var LASTNAME : String = "com.justpay.lastname"
var PHONENO : String = "com.justpay.phoneno"
var TOKEN : String = "com.justpay.token"
var DEVICE_ID : String = "com.justpay.deviceId"
var DEVICE_SECRET : String = "com.justpay.deviceSecret"

class JPUserDefaults: NSObject {

    class func setUserName(username:String) -> Void {
        UserDefaults.standard.set(username, forKey: USERNAME)
        UserDefaults.standard.synchronize()
    }
    
    class func getUserName() -> String {
        return UserDefaults.standard.value(forKey: USERNAME) as! String
    }
    
    
    class func setPassword(password:String) -> Void {
        UserDefaults.standard.set(password, forKey: PASSWORD)
        UserDefaults.standard.synchronize()
    }
    
    class func getPassword() -> String {
        return UserDefaults.standard.value(forKey: PASSWORD) as! String
    }
    
    
    class func setFirstName(firstName:String) -> Void {
        UserDefaults.standard.set(firstName, forKey: FIRSTNAME)
        UserDefaults.standard.synchronize()
    }
    
    class func getFirstName() -> String {
        return UserDefaults.standard.value(forKey: FIRSTNAME) as! String
    }
    
    
    class func setLastName(lastName:String) -> Void {
        UserDefaults.standard.set(lastName, forKey: LASTNAME)
        UserDefaults.standard.synchronize()
    }
    
    class func getLastName() -> String {
        return UserDefaults.standard.value(forKey: LASTNAME) as! String
    }
    
    
    class func setPhoneNo(phoneNo:String) -> Void {
        UserDefaults.standard.set(phoneNo, forKey: PHONENO)
        UserDefaults.standard.synchronize()
    }
    
    class func getPhoneNo() -> String {
        return UserDefaults.standard.value(forKey: PHONENO) as! String
    }
    
    
    class func setEmail(email:String) -> Void {
        UserDefaults.standard.set(email, forKey: EMAIL)
        UserDefaults.standard.synchronize()
    }
    
    class func getEmail() -> String {
        return UserDefaults.standard.value(forKey: EMAIL) as! String
    }
    
    class func setToken(token:String) -> Void {
        UserDefaults.standard.set(token, forKey: TOKEN)
        UserDefaults.standard.synchronize()
    }
    
    class func getToken() -> String {
        return UserDefaults.standard.value(forKey: TOKEN) as! String
    }
    
    class func setDeviceId(deviceId:NSNumber) -> Void {  // int
        UserDefaults.standard.set(deviceId, forKey: DEVICE_ID)
        UserDefaults.standard.synchronize()
    }
    
    class func getDeviceId() -> NSNumber {
        return UserDefaults.standard.value(forKey: DEVICE_ID) as! NSNumber 
    }
    
    class func setDeviceSecret(deviceSecret:String) -> Void {   // SAVE IN KEY STORE NOT HERE
        UserDefaults.standard.set(deviceSecret, forKey: DEVICE_SECRET)
        UserDefaults.standard.synchronize()
    }
    
    class func getDeviceSecret() -> String {
        return UserDefaults.standard.value(forKey: DEVICE_SECRET) as! String
    }
}
