//
//  NetworkManager.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 2/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import UIKit

@objc protocol NetworkManagerDelegate{
    optional func didRecieveResponse(info: [String:AnyObject]);
    optional func didRecievePageTitle(title: String)
    optional func didFailToReceiveResponse();
}

class NetworkManager: NSObject, NSURLSessionDelegate {
    
    
    //https://jsonplaceholder.typicode.com/users
    private let requestURL = NSURL ( string: "http://stackoverflow.com");
    var delegate: NetworkManagerDelegate?
    
    override init() {
        super.init();
    }
    
    
    func getLinkInfo(url: String) {
        
        let secureConfig = NSURLSessionConfiguration.ephemeralSessionConfiguration();
        secureConfig.TLSMinimumSupportedProtocol = SSLProtocol.TLSProtocol1;
        
        let session = NSURLSession (configuration: secureConfig, delegate: self, delegateQueue: NSOperationQueue.mainQueue());
        
        let request = NSMutableURLRequest (URL: NSURL( string: url)!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringCacheData, timeoutInterval: 0 )
        
        request.HTTPMethod = "GET";
        
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data: NSData? ,response: NSURLResponse? ,error: NSError?) in
            
            if let responseError = error {
                self.delegate?.didFailToReceiveResponse?()
                print( "Reponse Error: \( responseError )" )
            } else {
                let pageContent = String(NSString(data: data!, encoding: NSUTF8StringEncoding))
                self.delegate?.didRecievePageTitle?(pageContent);
                
            }
        });
            dataTask.resume();
            
        }
        
        func getLinkResutl() {
            let defaultConfigObject = NSURLSessionConfiguration.defaultSessionConfiguration();
            let defaultSession = NSURLSession (configuration: defaultConfigObject, delegate: self, delegateQueue: NSOperationQueue.mainQueue());
            let request = NSMutableURLRequest (URL: requestURL!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringCacheData, timeoutInterval: 0 )
            request.HTTPMethod = "GET";
            //request.setValue( "application/x-www-form-urlencoded" , forHTTPHeaderField: "Content-Type" )
            let dataTask = defaultSession.dataTaskWithRequest(request, completionHandler: { (data: NSData? ,response: NSURLResponse? ,error: NSError?) in
                if let responseError = error {
                    self.delegate?.didFailToReceiveResponse?()
                    print( "Reponse Error: \( responseError )" )
                } else {
                    do {
                        //for situatin that returns back json
                        //let dictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [[String:AnyObject]];
                        let dictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [String:AnyObject];
                        self.delegate?.didRecieveResponse?(dictionary!);
                        
                        
                        print( "Response: \( dictionary )" )
                        
                    } catch let jsonError as NSError {
                        // Handle parsing error
                        self.delegate?.didFailToReceiveResponse?()
                        print( "JSONError: \( jsonError.localizedDescription )");
                        let httpResponse = response as! NSHTTPURLResponse
                        let statusCode = httpResponse.URL
                        print(statusCode!)
                    }
                }
            });
            dataTask.resume();
        }
        
        
        
}
