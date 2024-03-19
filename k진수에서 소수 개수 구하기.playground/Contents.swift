import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let kRadix = String(n, radix: k).map({ String($0) })
    let numbers = kRadix.split(separator: "0").map {
        Int($0.joined())!
    }
    
    return numbers.filter({ isPrime($0) }).count
}

func isPrime(_ number: Int) -> Bool {
    if number == 1 {
        return false
    }
    else {
        var i = 2
        
        while i <= Int(sqrt(Double(number))) {
            if number % i == 0 { return false }
            
            i += 1
        }
        
        return true
    }
}

print(solution(1, 3))

//    n    k    result
//    437674    3    3
//    110011    10    2
