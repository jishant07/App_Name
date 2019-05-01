import Cocoa

let date = Date()
let formatter = DateFormatter()
formatter.dateFormat = "dd.MM.yyyy"
print(type(of: date))
let result = formatter.string(from: date)
print(type(of: result))
print(result)

