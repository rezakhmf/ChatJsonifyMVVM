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
    var inputMsgDictify = NSMutableDictionary()//NSMutableDictionary();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self;
    }
    
     func didFailToReceiveResponse() {
        print("nothing got back");
    }
    
    func didRecievePageTitle(URL URL: String, title: String){
    
        var linkInfo = [String:String]()
        linkInfo["url"] = URL;
        linkInfo["title"] = title;
        
        let link = Links(dictionary: linkInfo);
        
        self.inputMsgDictify["links"] = link;
        print(inputMsgDictify);
        
        
        
        let userMsg = UserMsg(dictionary: self.inputMsgDictify);
        print(userMsg);
        
        //self.inputMsg.text = "";
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
        
        print(mentions);
        print(emoticons);
        
        for item in mentions
        {
                self.inputMsgDictify.setValue(item, forKey: "mentions");
        }

        for item in emoticons
        {
            self.inputMsgDictify.setValue(item, forKey: "emoticons");
        }
        print("rezaaaaaaaa");
        print(self.inputMsgDictify["mentions"])
        //self.inputMsgDictify["mentions"] = mentions;
   //     self.inputMsgDictify.setObject((mentions as? NSArray)!, forKey: "mentions");
     //   self.inputMsgDictify["emoticons"] = emoticons;
    }
    
}

