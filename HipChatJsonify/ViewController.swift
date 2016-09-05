//
//  ViewController.swift
//  HipChatJsonify
//
//  Created by Reza Farahani on 14/08/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NetworkManagerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let manager  = NetworkManager();
        manager.delegate = self;
        manager.getWeatherInfo();
        print("loaded");
        //(@.[^\s]+) find mentioned
        //{(.*)} find emiticons
    }
    
     func didFailToReceiveResponse() {
        print("nothing got back");
    }
     func didRecieveResponse(info: Dictionary<String,AnyObject>) {
        //let name = info["name"];
       // print("name: \(info)");
        
       // print(info.startIndex.advancedBy(1));
        print(info)
       // let theKey = info.endIndex;
        //print(info);
        
        //let main = info["main"];
        //print("humidity: \(main!["humidity"])");
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

