import UIKit

var str = "Hello, playground"

let defaults = UserDefaults.standard

defaults.set(0.24, forKey: "volume")
defaults.set(true, forKey: "music")
defaults.set("SOurabh", forKey: "name")
defaults.set(Date(), forKey: "date")

let array = [1,2,3]
defaults.set(array, forKey: "array")

let dict = ["name":"Sourabh"]
defaults.set(dict, forKey: "dict")

let volume = defaults.float(forKey: "volume")
print(volume)
let myarray = defaults.array(forKey: "array")
print(myarray ?? "")

//class car {
//    var color = "Red"
//}
//
//let myCar = car()
//myCar.color = "blue"
//print(myCar.color)
//let obj = car()
//print(obj.color)


class car1 {
    var color = "Red"
    static let singletonCar = car1()
}

let meCar = car1.singletonCar
meCar.color = "Blue"

let yourCar = car1.singletonCar
print(yourCar.color)
