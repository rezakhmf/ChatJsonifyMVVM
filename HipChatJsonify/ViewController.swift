//
//  ViewController.swift
//  HipChatJsonify
//
//  Created by Reza Farahani on 14/08/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func test(sender: AnyObject) {
        
        let configuration = NSURLSessionConfiguration.ephemeralSessionConfiguration();
        
        configuration.TLSMinimumSupportedProtocol = SSLProtocol.TLSProtocol1;
        
        let url = NSURL.init(string: "http://stackoverflow.com");
        
        let request = NSURLRequest(URL: url!, cachePolicy: .ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 0);
        
        let session = NSURLSession(configuration: configuration);
        
        let task = session.dataTaskWithRequest(request) {data, response, error in
            if (error != nil){
                print(error);
                return;}
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.URL
            print(statusCode)
            print("task is completed");
        };
        
        task.resume();
    }

}

