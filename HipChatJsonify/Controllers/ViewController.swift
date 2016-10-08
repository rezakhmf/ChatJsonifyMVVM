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
    
    let networkManager  = NetworkManager();
    
    let group = dispatch_group_create()
    let queue: dispatch_queue_t = dispatch_queue_create("dispatch.asyncGroup", DISPATCH_QUEUE_CONCURRENT);
    
    var inputMsgDictify = Dictionary<String,[Any]>();
    var linkInfo = [String:String]();
    var links = [[String:String]]();
    var semaphore = 0;
    var locked = true;
    var resetFlag = false;
    var userMsg = UserMsg();
    var linksArray = Array<Link>();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.delegate = self;
        inputMsg.text = "sample input: @reza and @paul are coming in (happy) or (grumpy) on the follwing website http://smh.com.au and  http://news.com.au";
    }
    
     func didFailToReceiveResponse() {
        print("nothing got back");
    }
    
    func didRecievePageInfo(URL URL: String, title: String){
        
        let link = Link(url: URL, title: title)
        linksArray.append(link)
        
        self.semaphore -= 1;
        if(self.semaphore < 1 && !self.locked) {
            
            self.userMsg.links = linksArray;
            print(Util.dictiionaryToJsonString( Util.dicionaryToNSDictionary(self.userMsg.dictionaryRepresentation())));
                
            inputMsg.text = (Util.dictiionaryToJsonString( Util.dicionaryToNSDictionary(self.userMsg.dictionaryRepresentation())));
            
          
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
        
        let msg = self.inputMsg.text!;

        
        GCDispatch.asyncGroup(group,queue: queue){
            //var link = Link(dictionary: <#T##NSDictionary#>);
            let links = Util.linkMatches(input: msg);
            self.semaphore = links.count;
            links.map{self.networkManager.getURLContent($0)};
            }
        
        
        GCDispatch.asyncGroup(group,queue: queue){
            let mentions = Util.findByRegex(withRegex: "@(.[^\\s]+)", input: msg)
            var mentionsArray = Array<Mention>();
            for i in 0..<mentions.count{
                let mention = Mention(name: mentions[i]);
                mentionsArray.append(mention);
            }
            self.userMsg.mentions = mentionsArray;
        }
        
        
        GCDispatch.asyncGroup(group,queue: queue){
            let emoticons = Util.findByRegex(withRegex: "\\((.*?)\\)", input: msg)
            var emoticonsArray = Array<Emoticon>();
            for i in 0..<emoticons.count{
                let emoticon = Emoticon(name: emoticons[i]);
                emoticonsArray.append(emoticon);
            }
            self.userMsg.emoticons = emoticonsArray;
            //self.inputMsgDictify["emoticons"] = emoticons;
        }
        
        dispatch_group_notify(group, queue) {
            self.locked = false;
            self.resetFlag = true;
        }
        
    }
    
}

