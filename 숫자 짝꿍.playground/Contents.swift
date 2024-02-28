import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var answer = "9876543210".reduce("") { partialResult, number in
        let x = X.filter({ $0 == number })
        let y = Y.filter({ $0 == number })
        
        if !x.isEmpty, !y.isEmpty {
            return partialResult + Array(repeating: number, count: min(x.count, y.count))
        }
        
        return partialResult
    }
    
    if answer.isEmpty {
        return "-1"
    }
    
    return Set(answer) == ["0"] ? "0" : answer
}

//    X    Y    result
//    "100"    "2345"    "-1"
//    "100"    "203045"    "0"
//    "100"    "123450"    "10"
//    "12321"    "42531"    "321"
//    "5525"    "1255"    "552"

print(solution("100", "203045"))
