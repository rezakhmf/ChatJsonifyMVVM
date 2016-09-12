//
//  NetworkManager.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 2/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import UIKit

protocol NetworkManagerDelegate{
     func didFailToReceiveResponse();
     func didRecievePageTitle(URL URL: String, title: String);
}

class NetworkManager: NSObject, NSURLSessionDelegate {
    
    var delegate: NetworkManagerDelegate?
    
    
    override init() {
        super.init();
    }
    
    
    //MARK: — get page content of URL by Delegate class
    
    func getURLContent(url: String) {
        
        let secureConfig = NSURLSessionConfiguration.ephemeralSessionConfiguration();
        secureConfig.TLSMinimumSupportedProtocol = SSLProtocol.TLSProtocol1;
        
        let session = NSURLSession (configuration: secureConfig, delegate: self, delegateQueue: NSOperationQueue.mainQueue());
        
        let request = NSMutableURLRequest (URL: NSURL( string: url)!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringCacheData, timeoutInterval: 0 )
        
        request.HTTPMethod = "GET";
        
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data: NSData? ,response: NSURLResponse? ,error: NSError?) in
            
        
            if let responseError = error {
                self.delegate!.didFailToReceiveResponse()
                print( "Reponse Error: \( responseError )" )
            } else {
                let pageContent = String(NSString(data: data!, encoding: NSUTF8StringEncoding));
                
                let matchFinder = MatchFinder();
                let pageTitle = matchFinder.matchesInText(input: pageContent, regexPattern: "\\<title>.*?\\<\\/title>");
                self.delegate!.didRecievePageTitle(URL: url, title: pageTitle[0]);
            }
        });
        
                dataTask.resume();
    }
    
}
