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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self;
    }
    
     func didFailToReceiveResponse() {
        print("nothing got back");
    }
    
    func didRecievePageTitle(URL URL: String, title: String){
        var pageInfo = [String:String]();
        pageInfo[URL] = title;
        print(pageInfo);
    }

    @IBAction func test(sender: AnyObject) {
        
        let matchFinder = MatchFinder();
        
        let msg = self.inputMsg.text!;
        
        var links = matchFinder.linkMatches(input: msg);
        GCDispatch.async(){
            links.map{self.manager.getURLContent($0)};
        }
        
        //hala inja biam dige begam ke ba map har chie pass bedam be model class marboote
        let mentionsEmoticonsPattern = "(@.[^\\s]+)|\\((.*?)\\)";
        
        let mentiondsEmoticons = matchFinder.matchesInText(input: msg, regexPattern: mentionsEmoticonsPattern);
        print(mentiondsEmoticons);
        //let msgSpecialContent = MsgSpecialContent();
    }
    
}

