//
//  JPUser.swift
//  JustPay
//
//  Created by Abhishek Thapliyal on 12/5/16.
//  Copyright © 2016 InHeap. All rights reserved.
//

import UIKit

class JPUser: NSObject {

    public var userName = String()
    public var password = String()
    public var firstName = String()
    public var lastName = String()
    public var phoneNo = String()
    public var email = String()
    
    func toDictionary() -> [String : Any] {
        
        var dictionary = [String:Any]()
        let otherSelf = Mirror(reflecting: self)
        
        for child in otherSelf.children {
            
            if let key = child.label {
                dictionary[key] = child.value
            }
        }
        
        print("USER_DICTIONARY :: \(dictionary.description)")
        
        return dictionary
    }
}
