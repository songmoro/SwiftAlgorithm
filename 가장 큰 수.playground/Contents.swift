import Foundation

func solution(_ numbers:[Int]) -> String {
    let numbers: [String] = numbers.map({ String($0) }).sorted(by: { ($0 + $1) >= ($1 + $0) })

    return numbers[0] == "0" ? "0" : numbers.joined()
}

//    numbers    return
//    [6, 10, 2]    "6210"
//    [3, 30, 34, 5, 9]    "9534330"

print(solution([0, 0, 0, 10]))
