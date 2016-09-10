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
        manager.getLinkInfo();
        print("loaded");
        //(@.[^\s]+) find mentioned
        //{(.[^\s]+)} find emiticons
        //(\<title>.*?\<\/title>) title tag
    }
    
     func didFailToReceiveResponse() {
        print("nothing got back");
    }
    //func didRecieveResponse(info: [Dictionary<String,AnyObject>]) { for situaiton that returns back json array
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

