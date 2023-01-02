import UIKit

//var 변수 let 상수

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
//print(fruits, occupations)

fruits.append("blueberries")
//print(fruits)

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
let vegetable = "red pepper"
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
for (_, numbers) in interestingNumbers {
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
func greet(_ person : String,_ day : String) -> String {
    return "Hello \(person), today is \(day)."
}
//print(greet("LIM", "Monday"))

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


