//
//  ApiManager.swift
//  XmlParsing
//
//  Created by Sasi Gadu on 12/02/18.
//  Copyright © 2018 Sms country. All rights reserved.
//

import UIKit

class ApiManager: NSObject{

    
    public static func sendRequest(url:String, httpMethod:String, completionHandler:@escaping(Data)->Swift.Void) {
        
        let username = "7F4ECAE4C5184D0D"
        let password = "16BE9B3041764A01BF7D53A3839AE475"
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64loginString = loginData.base64EncodedString()
        let url = URL(string:url)!
        var request = URLRequest(url: url)
        request.setValue("Basic \(base64loginString)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = httpMethod
        
//        if params != nil {
//            do {
//                request.httpBody = try JSONSerialization.data(withJSONObject: params!, options: JSONSerialization.WritingOptions.prettyPrinted)
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print("error=\(String(describing:error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(String(describing: responseString))")
            
            
            completionHandler(data  as Data)
            
//          //  do {
//               // let response = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String:AnyObject]
//                completionHandler((data  as Data)
//
////            } catch {
////                print(error.localizedDescription)
////            }
        }
    
        task.resume()
    }
    
    
}
