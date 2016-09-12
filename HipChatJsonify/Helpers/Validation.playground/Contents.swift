//: Playground - noun: a place where people can play

import Cocoa
import XCPlayground

let input = "This is a test with the URL https://www.hackingwithswift.com to be detected. https://www.hackingwithswift.com d;lskfjdfl;kj https://www.hackingwithswift.com sflkdjsf;ldskjfdslkfj"
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


func matchesForRegexInText(regex: String, text: String) -> [String] {
    
    do {
        let regex = try NSRegularExpression(pattern: regex, options: [])
        let nsString = text as NSString
        let results = regex.matchesInString(text,
                                            options: [], range: NSMakeRange(0, nsString.length))
        return results.map { nsString.substringWithRange($0.range)}
    } catch let error as NSError {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}

let string = "🇩🇪€4€9 dfkldjsf;lkdj 🇩🇪€4€9 s;dlfkdjflkdj 🇩🇪€4€9 d;lsfkjd 🇩🇪€4€9";
let matchesString = matchesForRegexInText("[0-9]", text: string);
print(matchesString);





XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
