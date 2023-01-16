import UIKit

var myVariable = 42
myVariable = 50
let myConstant = 42
//myConstant = 41
//print(myVariable, myConstant)


// : 타입
let implicitInteger = 70
let idouble = 70.0
let eDouble: Double = 70

//print(implicitInteger, idouble, eDouble)

// type Convert
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
//print(widthLabel)

// String에서 \(constant or variable)



let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
let fruitSummary = "I habe \(apples + oranges) pieces of fruit."
//print(fruitSummary)

// """~"~"~"""


let quotation = """
I said " I have \(apples) apples."
And then I said "I  have \(apples + oranges) pieces of
    fruit."
"""
//print(quotation)

//array and dictionaries using basket []
var fruits = ["strawberries", "limes", "tangerines"]
fruits[1] = "grapes"
var occupations = [
    "Malcolm": "Captain",
    "Kaylee" : "Mechanic",
]
occupations["Jayne"]="Public Relations"
fruits.append("blueberries")
//print(fruits,occupations)

let emptyArray: [String] = []
let emptyDictionary:[String:Float] = [:]

let individualScores = [75, 43, 103, 83, 12]
var teamScore = 0
for score in individualScores{
    if score > 50{
        teamScore += 3
    } else {
        teamScore += 1
    }
}
//print(teamScore)

var optionalString: String? = "Hello"
//print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName{
    greeting = "Hello, \(name)"
}
//print(greeting)

let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"
//print(informalGreeting)
if let nickname { //nil 이라서 if문을 pass
    print("Hey \(nickname)")
}

/*
let vegetable = "red pepper while"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwitch.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}
*/


let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_,numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
//print(largest)

var n = 2
while n < 100 {
    n *= 2
}
//print(n) // 128
var m = 2
repeat {
    m *= 2
}while m < 100
//print(m) // 128

var total = 0
for i in 0..<4 {
    total += i
}
//print(total) //6


//func 함수 행성 "->" 반환형 _ 로 함수 호출시 argument 생략가능
func greet(person : String,day : String) -> String {
    return "Hello \(person), today is \(day)."
}
//print(greet(person: "LIM", day:"Monday"))

func calculateStatstics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatstics(scores: [5, 3, 100, 3, 9])
//print(statistics.sum, statistics.2, statistics)

//함수안에 함수 생성/호출 가능
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
//print(returnFifteen())

//함수가 함수를 반환하고 반환된 함수는 int 를 매개변수로 취하고 int를 반환
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int)-> Int {
        return 1 + number
    }
    return addOne
}
var incrementer =  makeIncrementer()
//print(incrementer(7))

func hasAnyMatches(list: [Int], condition: (Int)-> Bool) -> Bool {
    for item in list {
        if condition(item){
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
//print(hasAnyMatches(list: numbers, condition: lessThanTen))

let i = numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
//print(i)

let mappedNumbers = numbers.map({ number in 3 * number})
//print(mappedNumbers)

let sortedNumbers = numbers.sorted { $0 > $1 }
//print(sortedNumbers)

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String{
        return "A shape with \(numberOfSides) sides."
    }
}
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
//print(shapeDescription)

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
var n_shape = NamedShape(name: "ShapeName")
//print(n_shape.name)

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.7, name: "my test square")
//print(test.area(), test.simpleDescription())

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
//print(triangle.perimeter, triangle.simpleDescription())
triangle.perimeter = 9.9
//print(triangle.sideLength)

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String){
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
//print(triangleAndSquare.square.sideLength)
//print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
//print(triangleAndSquare.triangle.sideLength)

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
//print(ace, ace.rawValue, Rank.king, Rank.king.rawValue)

enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartDescription = hearts.simpleDescription()

enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
/*
switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure... \(message)")
}
*/

struct Card {
    var rank: Rank
    var suit: Suit
    func simoleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simoleDescription()
//print(threeOfSpadesDescription)

func fetchUserID(from server: String) async -> Int {
    if server == "primary"{
        return 97
    }
    return 501
}
func fetchUsername(from server: String) async -> String {
    let userID = await fetchUserID(from: server)
    if userID == 501 {
        return "John Appleseed"
    }
    return "Guest"
}
func connectUser(to server: String) async {
    async let userID = fetchUserID(from: server)
    async let username = fetchUsername(from: server)
    let greeting = await "Hello \(username), userID \(userID)"
    print(greeting)
}
Task {
    //await connectUser(to: "primary")
}

protocol ExampleProtocol {
    var simpleDescription: String {get}
    mutating func adjust()
}
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDesrciption = a.simpleDescription
struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure."
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
//print(aDesrciption, bDescription)

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
/*
print(7.simpleDescription)
var aaa = 7
aaa.adjust()
print(aaa)
*/

enum PrinterError : Error {
    case outOfPaper
    case noToner
    case onFire
}
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never has Toner" {
        throw PrinterError.noToner
    }
    return "job sent"
}
/*
do {
    let printerResponse = try send(job: 1040, toPrinter: "Never has Toner")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError)")
} catch {
    print(error)
}
*/

let printerSucces = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never has Toner")
//print("\(printerSucces), \(printerFailure)")

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("eggs")
//print(fridgeIsOpen)

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
//print(makeArray(repeating: "knock", numberOfTimes: 4))

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)


func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U)->Bool
where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
print(anyCommonElements([1,2,3], [3]))
