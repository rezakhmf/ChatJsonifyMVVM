//
//  ViewController.swift
//  HipChatJsonify
//
//  Created by Reza Farahani on 14/08/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NetworkManagerDelegate{

    @IBOutlet weak var inputMsg: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        //print("loaded");
        
        let manager  = NetworkManager();
        manager.delegate = self;
        manager.getURLContent("http://stackoverflow.com");
        print("loaded");

        
        //(@.[^\s]+) find mentioned
        //{(.[^\s]+)} find emiticons
        //(\<title>.*?\<\/title>) title tag
    }
    
     func didFailToReceiveResponse() {
        print("nothing got back");
    }
    
    func didRecievePageTitle(URL: String, title: String){
        print("called");
        var pageInfo = [String:String]();
        pageInfo[URL] = title;
        print(pageInfo);
    }

    @IBAction func test(sender: AnyObject) {
        
        let matchFinder = MatchFinder();
        
        let msg = self.inputMsg.text!;
        
        var links = matchFinder.linkMatches(input: msg);
        
        GCDispatch.async(){
            
            let manager  = NetworkManager();
            manager.delegate = self;
            links.map{manager.getURLContent($0)};

        }
        
        
        let mentionsEmoticonsPattern = "(@.[^\\s]+)|\\((.*?)\\)";
        
        let mentiondsEmoticons = matchFinder.matchesInText(input: msg, regexPattern: mentionsEmoticonsPattern);
        print(mentiondsEmoticons);
        //let msgSpecialContent = MsgSpecialContent();
    }
    
}

