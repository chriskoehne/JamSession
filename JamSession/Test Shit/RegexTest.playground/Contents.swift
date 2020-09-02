import Foundation

let email = "ckfffffffffffffffoehne@purdue.edu"

//let regex = "^([a-zA-Z0-9]{2,15}@purdue.edu)$"
//email.range(of: #"([a-zA-Z0-9]{2,15}@purdue.edu)$"#, options: .regularExpression) != nil // true

let regex = try! NSRegularExpression(pattern: "(^[a-zA-Z0-9]{2,15}@purdue.edu)$")
let range = NSRange(location: 0, length: email.utf16.count)
regex.firstMatch(in: email, options: [], range: range) != nil

func verifyEmail() -> Bool {
    let email = "ckfffffffffffffffoehne@purdue.edu"
    let regex = try! NSRegularExpression(pattern: "(^[a-zA-Z0-9]{2,15}@purdue.edu)$")
    let range = NSRange(location: 0, length: email.utf16.count)
    return regex.firstMatch(in: email, options: [], range: range) != nil
}

print(verifyEmail())
