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
        manager.delegate = self;
        inputMsg.text = "sample input: @john and @puall are comming in (happy) or (grumpy) on the follwing website http://smh.com.au and  http://news.com.au";
    }
    
     func didFailToReceiveResponse() {
        print("nothing got back");
    }
    
    func didRecievePageTitle(URL URL: String, title: String){
        
        var link = Link(url: URL, title: title)
        linksArray.append(link)
     
        //linkInfo["url"] = URL;
        //linkInfo["title"] = title;
        //links.append(linkInfo);
        
        //self.inputMsgDictify["links"] = links;
    
        self.semaphore -= 1;
        if(self.semaphore < 1 && !self.locked) {
            
            self.userMsg.links = linksArray;
            
            print(self.userMsg.links!);
//            if let json = self.userMsg.toJSON() {
//                print(json)
//            }
           // let usrMsg = UserMsg(dictionary: self.inputMsgDictify);
        
            //print(Util.dictiionaryToJsonString(usrMsg!.dictionaryRepresentation()));
        
            //inputMsg.text = Util.dictiionaryToJsonString(usrMsg!.dictionaryRepresentation());//Utils.dictiionaryToJsonString(inputMsgDictify);
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
            links.map{self.manager.getURLContent($0)};
            }
        
        
        GCDispatch.asyncGroup(group,queue: queue){
            let mentions = Util.findByRegex(withRegex: "@(.[^\\s]+)", input: msg)
            var mentionsArray = Array<Mention>();
            for i in 0..<mentions.count{
                let mention = Mention(name: mentions[i]);
                mentionsArray.append(mention);
            }
            self.userMsg.mentions = mentionsArray;
            //self.inputMsgDictify["mentions"] = mentions;//mention?modelsFromDictionaryArray
                //Mention.StringArrayOfMentionsNamefromMessage(msg);
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

