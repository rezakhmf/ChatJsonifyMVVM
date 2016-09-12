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
    
    let manager  = NetworkManager();
    var inputMsgDictify = Dictionary<String, [AnyObject]>();//NSMutableDictionary();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self;
    }
    
     func didFailToReceiveResponse() {
        print("nothing got back");
    }
    
    func didRecievePageTitle(URL URL: String, title: String){
    
        var links = [Dictionary<String, String>]();
        var linkInfo = Dictionary<String, String>();
        linkInfo["url"] = URL;
        linkInfo["title"] = title;
        links.append(linkInfo);
        
        self.inputMsgDictify["links"] = links;
        
        let userMsg = UserMsg(dictionary: self.inputMsgDictify);
    }

    @IBAction func test(sender: AnyObject) {
        
        let matchFinder = MatchFinder();
        
        let msg = self.inputMsg.text!;
        
        
        GCDispatch.async(){
            let links = matchFinder.linkMatches(input: msg);
            links.map{self.manager.getURLContent($0)};
        }
        
        let mentions = matchFinder.capturedGroups(withRegex: "@(.[^\\s]+)", input: msg);
        let emoticons = matchFinder.capturedGroups(withRegex: "\\((.*?)\\)", input: msg);
    
        self.inputMsgDictify["mentions"] = mentions;
        self.inputMsgDictify["emoticons"] = emoticons;
    }
    
}

