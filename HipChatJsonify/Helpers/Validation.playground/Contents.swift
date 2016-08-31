//: Playground - noun: a place where people can play

import Cocoa

let input = "This is a test with the URL https://www.hackingwithswift.com to be detected."
let detector = try! NSDataDetector(types: TextCheckingResult.CheckingType.link.rawValue)
let matches = detector.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))

for match in matches {
    let url = (input as NSString).substring(with: match.range)
    print(url)
}

print("reza");
