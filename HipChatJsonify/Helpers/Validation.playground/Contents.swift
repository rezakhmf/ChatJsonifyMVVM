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
print(linkMatches);


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
        let regex = try NSRegularExpression(pattern: regex, options: []);
        let nsString = text as NSString;
        let results = regex.matchesInString(text,
                                            options: [], range: NSMakeRange(0, nsString.length));
        results.map{print($0)};
        return results.map{ nsString.substringWithRange($0.range)};
    } catch let error as NSError {
       print("invalid regex: \(error.localizedDescription)")
        return []
    }
}




let titleHTML = "<title>reza</title>"
//let title = matchesForRegexInText("<title>(.+?)<\\/title>" , text: titleHTML)[0];
let title2 = matchesForRegexInText("<title>(.+?)<\\/title>" , text: titleHTML);
print(title2[0]);
//print(title.substringWithRange(Range<String.Index>(start: title.startIndex.advancedBy(7), end: title.endIndex.advancedBy(-8))));

let regex   = try! NSRegularExpression(pattern: "(?<=\\()[^()]{1,10}(?=\\))", options: [])
let text = "(some text) some other text";
regex.enumerateMatchesInString(text, options: [], range: NSMakeRange(0, (text as NSString).length))
{
    (result, _, _) in
    let match = (text as NSString).substringWithRange(result!.range)
    
    if (match.characters.count <= 10)
    {
        print(match)
    }
}



func capturedGroups(withRegex pattern: String, text: String) -> [String] {
    var results = [String]()
    
    var regex: NSRegularExpression
    do {
        regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
    } catch {
        return results
    }
    
    let matches = regex.matchesInString(text, options: [], range: NSRange(location:0, length: text.characters.count))
    
   // guard let match = matches.first else { return matches }
    
    
    
    //let lastRangeIndex = match.numberOfRanges - 1
    //guard lastRangeIndex >= 1 else { return results }
    
    //for i in 1...lastRangeIndex {
    for match in matches {
        let capturedGroupIndex = match.rangeAtIndex(1)
        let matchedString = (text as NSString).substringWithRange(capturedGroupIndex)
        results.append(matchedString)
    }
    
    return results
}


print(capturedGroups(withRegex: "<title>(.+?)<\\/title>",text: "<title>reza</title>"));


let emitcons = " @john and @puall are comming in (happy) or (grumpy) on the follwing website http://stackoverflow.com and  http://news.com.au";
let emitconMatches = capturedGroups(withRegex: "@(.[^\\s]+)" , text: emitcons);
let mentionsMatches = capturedGroups(withRegex: "\\((.*?)\\)" , text: emitcons);
print(emitconMatches);
print(mentionsMatches);

//This is a dictionary that will be an embedded object in a later dictionary below.
var nameDictionary: NSDictionary = ["first":"James", "last":"Jameson"]
//This is your data as a Dictionary of key:value. Note the unvarying string data type of the key and varying data types of the values.
var dataDictionary: NSDictionary = ["name":nameDictionary, "age": 25, "location":"London", "isMember":true, "balance":102.32]
var marr = ["reza","ali"];
//Do, try , catch
do {
    //this is your json data as NSData that will be your payload for your REST HTTP call.
    let JSONPayload: NSData = try NSJSONSerialization.dataWithJSONObject(dataDictionary, options: NSJSONWritingOptions.PrettyPrinted)
    
    //This is unnecessary, but I'm echo-checking the data from the step above.  You don't need to do this in production.  Just to see the JSON in native format.
    let JSONString = NSString(data: JSONPayload, encoding: NSUTF8StringEncoding) as! String
    print("\(JSONString)")
    
    //From here you should carry on with your task or assign JSONPayload to a varialble outside of this block
} catch {//catch errors thrown by the NSJSONSerialization.dataWithJSONObject func above.
    let err = error as NSError
    NSLog("\(err.localizedDescription)")
}

let myDictionary: [String:[AnyObject]] = ["Hello": [1, 2, 3], "World": [4, 5, 6]];
print(myDictionary);




let group = dispatch_group_create();
dispatch_group_notify(group, dispatch_get_main_queue()){
    print("finished")
};

for i in 0..<4 {
    dispatch_group_enter(group);
        print(i)
    //print(group.)
    sleep(2);
    
    dispatch_group_leave(group);
    
}
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
