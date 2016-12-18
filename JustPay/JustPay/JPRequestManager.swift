//
//  JPRequestManager.swift
//  JustPay
//
//  Created by Abhishek Thapliyal on 12/5/16.
//  Copyright © 2016 InHeap. All rights reserved.
//

import UIKit

class JPRequestManager: NSObject {

//====================================================================================================================================
// UNIVERSAL POST REQUEST METHOD
//====================================================================================================================================
    
    class func postServerRequest(urlString:String, paramString:String?, body:Data) -> NSMutableURLRequest {
        
        var URLString : String = urlString
        if (paramString != nil || !(paramString?.isEmpty)!) {
            URLString = String(format:"%@?%@", urlString, paramString!)
        }
        let requestURL = URL(string:URLString)!
        let request = NSMutableURLRequest(url:requestURL)
        request.httpMethod = "POST"
        request.timeoutInterval = 1000
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        
        self.addHeadersParameters(request: request)
        
        return request
    }
    
//====================================================================================================================================
// UNIVERSAL GET REQUEST METHOD
//====================================================================================================================================
    
    class func getServerRequest(urlString:String, paramString:String?) -> NSMutableURLRequest {
        
        var URLString : String = urlString
        if paramString != nil {
            URLString = String(format:"%@?%@", urlString, paramString!)
        }
        let requestURL = URL(string:URLString)!
        let request = NSMutableURLRequest(url:requestURL)
        request.httpMethod = "GET"
        request.timeoutInterval = 1000
        
        return request
    }
    
//====================================================================================================================================
// UNIVERSAL ADD HEADERS METHOD
//====================================================================================================================================
    
    class func addHeadersParameters(request:NSMutableURLRequest) -> Void {
      
            let authString : String = String(format:"Bearer %@", JPUserDefaults.getToken())
            if (!authString.isEmpty) {
                request.addValue(authString, forHTTPHeaderField: "Authorization")
            }
            let deviceId : String = String(format: "%@", JPUserDefaults.getDeviceId())
            if (!deviceId.isEmpty) {
            request.addValue(deviceId, forHTTPHeaderField: "DeviceId")
            request.addValue(JPUserDefaults.getUserName(), forHTTPHeaderField: "UserName")
        }
    }
    
}
