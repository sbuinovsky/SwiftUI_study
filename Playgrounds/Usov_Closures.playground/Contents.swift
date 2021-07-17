import UIKit
import Foundation

// initialize wallet
var wallet = [50, 100, 100, 200, 500, 1000, 5000]


// handle 100 banknotes
func handle100(wallet: [Int]) -> [Int] {
    var returnWallet: [Int] = []
    
    for banknote in wallet {
        if banknote == 100 {
            returnWallet.append(banknote)
        }
    }
    
    return returnWallet
}

// Using function
print(handle100(wallet: wallet))


// Main function
func handle(wallet: [Int], closure: (Int) -> Bool) -> [Int] {
    var returnWallet: [Int] = []
    
    for banknote in wallet {
        if closure(banknote) {
            returnWallet.append(banknote)
        }
    }
    
    return returnWallet
}

// function compare 100
func compare100(banknote: Int) -> Bool {
    return banknote == 100
}

// function compare more than 1000
func compareMore1000(banknote: Int) -> Bool {
    return banknote >= 1000
}

//Using function
let resultWalletOne = handle(wallet: wallet, closure: compare100)
print(resultWalletOne)

let resultWalletTwo = handle(wallet: wallet, closure: compareMore1000)
print(resultWalletTwo)

// Closure using

let resultWalletThree = handle(wallet: wallet,
                               closure: {(banknote: Int) -> Bool in
                                return banknote >= 1000
                               })

// Without type writing
let resultWalletFour = handle(wallet: wallet,
                               closure: {banknote in
                                return banknote >= 1000
                               })

// If only one expression with return in closure don't need return
let resultWalletFive = handle(wallet: wallet, closure: {banknote in banknote >= 1000})

// If only one expression don't need to type parameter name and "in" expression
let resultWalletSix = handle(wallet: wallet, closure: {$0 >= 1000})

// Move closure out the brackets
let resultWalletSeven = handle(wallet: wallet) {$0 >= 1000}

//Multiple closures out the brackets

func networkQuery(url: String,
                  success: (String) -> (),
                  error: (Int) -> ()) {
    // Server request code here
}

networkQuery(url: "https://weather.com") { data in
    // ...
} error: { errorCode in
    // ...
}

// Closure init in parameter
let closure: () -> Void = {
    print("Closure expression")
}

closure()

let closurePrint: (String) -> Void = { text in
    print(text)
}

let closurePrintShort: (String) -> Void = {
    print($0)
}

closurePrint("Some text for print")
closurePrintShort("Some text for print")

var sum: (_ numOne: Int, _ numTwo: Int) -> Int = {
    $0 + $1
}

sum(10,15)

// Array sorting with closures

let array = [2,44,67,24,89,54,23,12,998,657]

var sortedArray = array.sorted(by: { (first: Int, second: Int) -> Bool in
    return first < second
})

var sortedArrayShort = array.sorted(by: {$0 < $1})
print(sortedArrayShort)

var sortedArrayVeryShort = array.sorted(by: >)
print(sortedArrayVeryShort)

// Fixing of inner parameters in closure
var a = 1, b = 2

let closureSum: () -> Int = { [a, b] in
    a + b
}

closureSum()

a = 15; b = 20

closureSum()

// Capture external vars
func makeIncrement(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func increment() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return increment
}

var incrementByTen = makeIncrement(forIncrement: 10)
var incrementBySeven = makeIncrement(forIncrement: 7)

incrementByTen()
incrementByTen()
incrementByTen()
incrementBySeven()
incrementBySeven()
incrementBySeven()
incrementByTen()
incrementBySeven()

// Escaping closures

var arrayOfClosures: [() -> Int] = []

func addNewClosureInArray(_ newClosure: @escaping () -> Int) {
    arrayOfClosures.append(newClosure)
}

addNewClosureInArray({return 100})
addNewClosureInArray({return 1000})
arrayOfClosures[0]()
arrayOfClosures[1]()
print(arrayOfClosures)
