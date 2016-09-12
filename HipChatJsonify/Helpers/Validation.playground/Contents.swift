//: Playground - noun: a place where people can play

import Cocoa
import XCPlayground

let input = "This is a test with the URL https://www.hackingwithswift.com to be detected. https://www.hackingwithswift.com d;lskfjdfl;kj https://www.hackingwithswift.com sflkdjsf;ldskjfdslkfj"

let detector = try NSDataDetector(types: NSTextCheckingType.Link.rawValue)
let matches = detector.matchesInString(input, options: [], range: NSRange(location:0, length: input.utf8.count));
    
    
    for match in matches {
        let url = (input as NSString).substringWithRange(match.range);
        //print(url)
}

let NSInput = input as NSString;
let linkMatches = matches.map{NSInput.substringWithRange($0.range)};
//print(linkMatches);


let configuration = NSURLSessionConfiguration.ephemeralSessionConfiguration();

configuration.TLSMinimumSupportedProtocol = SSLProtocol.TLSProtocol1;

let url = NSURL.init(string: "http://stackoverflow.com");

let request = NSURLRequest(URL: url!, cachePolicy: .ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 0);

let session = NSURLSession(configuration: configuration);

    let task = session.dataTaskWithRequest(request) { (data, response, error) in
    if (error != nil){ print(error);}
    //print(response);
    let httpResponse = response as! NSHTTPURLResponse
    let statusCode = httpResponse.URL
       // print(statusCode!);
    //print(data);
       // print("task is completed");
  
        do{
            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments);
            //print(json);
            
        }catch{
        }


};

task.resume();




let configuration2 = NSURLSessionConfiguration.ephemeralSessionConfiguration();

configuration.TLSMinimumSupportedProtocol = SSLProtocol.TLSProtocol1;

let url2 = NSURL.init(string: "http://stackoverflow.com");

let request2 = NSURLRequest(URL: url2!, cachePolicy: .ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 0);

let session2 = NSURLSession(configuration: configuration2);

let task2 = session.dataTaskWithRequest(request2) {data, response, error in
    if (error != nil){
       // print(error);
        return;}
    let httpResponse = response as! NSHTTPURLResponse
    let statusCode = httpResponse.URL
   // print(httpResponse)
    //print("task is completed");
};

task2.resume();

func matchesForRegexInText(regex: String, text: String) -> [String] {
    
    do {
        let regex = try NSRegularExpression(pattern: regex, options: [])
        let nsString = text as NSString
        let results = regex.matchesInString(text,
                                            options: [], range: NSMakeRange(0, nsString.length))
        return results.map{ nsString.substringWithRange($0.range)}
    } catch let error as NSError {
       print("invalid regex: \(error.localizedDescription)")
        return []
    }
}


let emitcons = "reza @ali mohamad @amir maman (baba) baghie (elahe) http://stackoverflow.com";
let emitconMatches = matchesForRegexInText("(@.[^\\s]+)|\\((.*?)\\)" , text: emitcons);
//print(emitconMatches);


let titleHTML = "<title>reza</title> dsflkjsdf"
let title = matchesForRegexInText("<title>(.+?)<\\/title>" , text: titleHTML)[0];
print(title.substringWithRange(Range<String.Index>(start: title.startIndex.advancedBy(7), end: title.endIndex.advancedBy(-8))));






XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
