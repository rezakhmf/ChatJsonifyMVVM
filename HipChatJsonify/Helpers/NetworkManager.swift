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
    optional func didFailToReceiveResponse();
}

class NetworkManager: NSObject, NSURLSessionDelegate {
    
    
    
    private let requestURL = NSURL ( string: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=2de143494c0b295cca9337e1e96b00e0" );
    var delegate: NetworkManagerDelegate?
    
    override init() {
        super.init();
    }


    func getWeatherInfo() {
        let defaultConfigObject = NSURLSessionConfiguration.defaultSessionConfiguration();
        let defaultSession = NSURLSession (configuration: defaultConfigObject, delegate: self, delegateQueue: NSOperationQueue.mainQueue());
        let request = NSMutableURLRequest (URL: requestURL!, cachePolicy: NSURLRequestCachePolicy .ReloadIgnoringCacheData, timeoutInterval: 60 )
        request.HTTPMethod = "POST";
        request.setValue( "application/x-www-form-urlencoded" , forHTTPHeaderField: "Content-Type" )
        let dataTask = defaultSession.dataTaskWithRequest(request, completionHandler: { (data: NSData? ,response: NSURLResponse? ,error: NSError?) in
            if let responseError = error {
                    self.delegate?.didFailToReceiveResponse?()
                    print( "Reponse Error: \( responseError )" )
                } else {
                    do {
                        let dictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! [ String : AnyObject ];
                        self.delegate?.didRecieveResponse?(dictionary);
                        print( "Response: \( dictionary )" )
                    } catch let jsonError as NSError {
                        // Handle parsing error
                        self.delegate?.didFailToReceiveResponse?()
                        print( "JSONError: \( jsonError.localizedDescription )");
                }
                }
            })
            dataTask.resume()
        }


}
