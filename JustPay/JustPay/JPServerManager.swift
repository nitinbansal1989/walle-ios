//
//  JPServerManager.swift
//  JustPay
//
//  Created by Abhishek Thapliyal on 12/5/16.
//  Copyright © 2016 InHeap. All rights reserved.
//

import UIKit

//var baseURL : String = "www.justpay.com"
var baseURL : String = "http://192.168.0.105:3003"
var registrationURL : String = "/auth/register"
var loginURL : String = "/auth/login"
var checkUserURL : String = "/auth/check"
var userInfoURL : String = "/user"
var userUpdateURL : String = "/user"
var userDeleteURL : String = "/user"
var logoutURL : String = "/auth/logout"
var paymentURL : String = "/pay"

class JPServerManager: NSObject {

    
//====================================================================================================================================
// JUSTPAY : USER REGISTRATION
//====================================================================================================================================
    
    public func userRegistration(user:JPUser, completion : @escaping (_ json:Any, _ error:NSError?) -> Void) -> Void {
        
        let urlString : String = String(format:"%@%@", baseURL, registrationURL)
        
        let postdata = try! JSONSerialization.data(withJSONObject: user.toDictionary(), options: [])
//        let paramString = String(data: postdata, encoding: String.Encoding.utf8)
        
        let request : NSMutableURLRequest = JPRequestManager.postServerRequest(urlString: urlString, paramString: "", body : postdata)
        JPResponseManager.responseWithRequest(request: request, requestTitle: "USER_REGISTRATION", completion: { (json, error) in
        
            // TODO
           // let jsonDict : NSDictionary = json as! NSDictionary
            print("RESPONSE :: USER_REGISTRATION :: \(json)")
            print("ERROR :: USER_REGISTRATION (IF-ANY) :: \(error?.localizedDescription)")
            completion(json, error)
        })
    }
    
//====================================================================================================================================
// JUSTPAY : USER LOGIN
//====================================================================================================================================

    public func userlogin(jpUser:JPUser, completion : @escaping (_ json:Any, _ error:NSError?) -> Void) -> Void {
        
        let urlString : String = String(format:"%@%@", baseURL, loginURL)
        
        var dictionary = Dictionary<String,String>()
        dictionary["userName"] = jpUser.userName
        dictionary["password"] = jpUser.password
        dictionary["platform"] = "IOS"
        //        dictionary["deviceId"] = nil
        
        let postdata = try! JSONSerialization.data(withJSONObject:dictionary, options: [])
        
        let request : NSMutableURLRequest = JPRequestManager.postServerRequest(urlString: urlString, paramString: "", body: postdata)
        JPResponseManager.responseWithRequest(request: request, requestTitle: "USER_LOGIN", completion: { (json, error) in
            
            // TODO
            let jsonDict : NSDictionary = json as! NSDictionary
            print("RESPONSE :: USER_LOGIN :: \(jsonDict.description)")
            print("ERROR :: USER_LOGIN (IF-ANY) :: \(error?.localizedDescription)")
            
            if(jsonDict.count > 0) {
                
                let devSecret : String = jsonDict["deviceSecret"] as! String
                JPUserDefaults.setDeviceSecret(deviceSecret: devSecret)
                
                JPUserDefaults.setToken(token: jsonDict["token"] as! String)
                
                let deviceId : NSNumber = jsonDict["deviceId"] as! NSNumber
                JPUserDefaults.setDeviceId(deviceId:deviceId)
            }
            
            completion(json, error)
        })
    }

//====================================================================================================================================
// JUSTPAY : USER LOGOUT
//====================================================================================================================================
    
    public func userlogout() -> Void {
        
        // LOGOUT FORM SERVER
//        let urlString : String = String(format:"%@%@", baseURL, logoutURL)
//        let request : NSMutableURLRequest = JPRequestManager.postServerRequest(urlString: urlString, paramString: "",body: nil)
//        JPResponseManager.responseWithRequest(request: request, requestTitle: "USER_LOGOUT", completion: { (json, error) in
//    
//            // TODO
//            let jsonDict : NSDictionary = json as! NSDictionary
//        })
//        // CLEAR DB IF REQUIRE
//        // CLEARING USER DEFAULTS
//        let bundle = Bundle.main.bundleIdentifier!
//        UserDefaults.standard.removePersistentDomain(forName: bundle)
//        UserDefaults.standard.synchronize()
    }

//====================================================================================================================================
// JUSTPAY : PAYMENT
//====================================================================================================================================
    

    public func makePayment(amount:NSString, completion : @escaping (_ json:Any, _ error:NSError?) -> Void) -> Void {
        
        let urlString : String = String(format:"%@%@", baseURL, paymentURL)
        
        var dictionary = Dictionary<String,Any>()
        
        dictionary["senderUserName"] = "1234567891"
        dictionary["senderDeviceId"] = NSNumber(value:Int(amount as String)!)
        dictionary["token"] = "KCzdplxZTUWSici7uAV6TF38rRwFupZt"
        
//        var dictionary = [
//            "senderUserName" : "1234567891",
//            "amount": NSNumber(value:Int(amount as String)!),
//            "token" : "KCzdplxZTUWSici7uAV6TF38rRwFupZt"
//        ] as [String : Any]
        
        let postdata = try! JSONSerialization.data(withJSONObject:dictionary, options: [])
        
        let request : NSMutableURLRequest = JPRequestManager.postServerRequest(urlString: urlString, paramString: "", body: postdata)
        JPResponseManager.responseWithRequest(request: request, requestTitle: "USER_PAYMENT", completion: { (json, error) in
            
            // TODO
            let jsonDict : NSDictionary = json as! NSDictionary
            print("RESPONSE :: USER_PAYMENT :: \(jsonDict.description)")
            print("ERROR :: USER_PAYMENT (IF-ANY) :: \(error?.localizedDescription)")
            
            completion(json, error)
        })
    }
    
}

