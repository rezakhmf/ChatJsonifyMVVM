//: Playground - noun: a place where people can play

import Cocoa
import XCPlayground

let input = "This is a test with the URL https://www.hackingwithswift.com to be detected."
let detector = try NSDataDetector(types: NSTextCheckingType.Link.rawValue)
let matches = detector.matchesInString(input, options: [], range: NSRange(location:0, length: input.utf8.count));
    
    
    for match in matches {
        let url = (input as NSString).substringWithRange(match.range);
    print(url)
}


let configuration = NSURLSessionConfiguration.ephemeralSessionConfiguration();

configuration.TLSMinimumSupportedProtocol = SSLProtocol.TLSProtocol1;

let url = NSURL.init(string: "http://stackoverflow.com");

let request = NSURLRequest(URL: url!, cachePolicy: .ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 0);

let session = NSURLSession(configuration: configuration);

    let task = session.dataTaskWithRequest(request) { (data, response, error) in
    if (error != nil){ print(error);}
    print(response);
    let httpResponse = response as! NSHTTPURLResponse
    let statusCode = httpResponse.URL
    print(statusCode!);
    //print(data);
    print("task is completed");
  
        do{
            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments);
            print(json);
            
        }catch{
        }


};

task.resume();

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
