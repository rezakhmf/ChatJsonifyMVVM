//
//  ViewController.swift
//  HipChatJsonify
//
//  Created by Reza Farahani on 14/08/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NetworkManagerDelegate{

    
    
    @IBOutlet weak var inputMsg: UITextView!
    
    @IBOutlet weak var digestify: UIButton!
    
    let manager  = NetworkManager();
    
    let group = dispatch_group_create()
    let queue: dispatch_queue_t = dispatch_queue_create("dispatch.asyncGroup", DISPATCH_QUEUE_CONCURRENT);
    
    var inputMsgDictify = [String:[AnyObject]]();
    var linkInfo = [String:String]();
    var links = [[String:String]]();
    var semaphore = 0;
    var locked = true;
    var resetFlag = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self;
        inputMsg.text = "sample input: @john and @puall are comming in (happy) or (grumpy) on the follwing website http://stackoverflow.com and  http://news.com.au";
    }
    
     func didFailToReceiveResponse() {
        print("nothing got back");
    }
    
    func didRecievePageTitle(URL URL: String, title: String){
     
        linkInfo["url"] = URL;
        linkInfo["title"] = title;
        links.append(linkInfo);
        
        self.inputMsgDictify["links"] = links;
    
        self.semaphore -= 1;
        if(self.semaphore < 1 && !self.locked) {
            print(inputMsgDictify);
            inputMsg.text = Utils.dictiionaryToJsonString(inputMsgDictify);
            digestify.titleLabel?.text = "Reset"
            inputMsgDictify.removeAll();
            resetFlag = true;
        }
    }
    
    
    @IBAction func msgDistiller(sender: AnyObject) {
    

        if(self.resetFlag) {
            inputMsg.text = "";
            sender.setTitle("Digestify", forState: .Normal);
        }
        
        guard(inputMsg.text != "") else {
            inputMsg.text = "please enter your message!";
            return;
        }
        
        let matchFinder = MatchFinder();
        let msg = self.inputMsg.text!;

        
        GCDispatch.asyncGroup(group,queue: queue){
            let links = matchFinder.linkMatches(input: msg);
            self.semaphore = links.count;
            links.map{self.manager.getURLContent($0)};
            }
        
        
        GCDispatch.asyncGroup(group,queue: queue){
            let mentions = matchFinder.capturedGroups(withRegex: "@(.[^\\s]+)", input: msg);
            self.inputMsgDictify["mentions"] = mentions;
        }
        
        
        GCDispatch.asyncGroup(group,queue: queue){
            let emoticons = matchFinder.capturedGroups(withRegex: "\\((.*?)\\)", input: msg);
            self.inputMsgDictify["emoticons"] = emoticons;
        }
        
        dispatch_group_notify(group, queue) {
            self.locked = false;
            self.resetFlag = true;
        }
        
    }
    
}

