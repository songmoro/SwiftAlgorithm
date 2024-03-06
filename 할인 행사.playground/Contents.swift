import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var able = 0
    let count = number.reduce(0) { $0 + $1 }
    let list = Dictionary(uniqueKeysWithValues: zip(want, number))
    let discount = discount + Array(repeating: "", count: count)
    
    for i in 0..<(discount.count - count) {
        let dict = discount[i..<(i + count)].reduce(into: [:]) { partialResult, stuff in
            partialResult[stuff, default: 0] += 1
        }
        
        let isAble = list.reduce(into: []) {
            if $1.value > (dict[$1.key] ?? 0) {
                $0.append(0)
            }
        }.isEmpty
        
        able += isAble ? 1 : 0
    }
    
    return able
}

//    want    number    discount    result
//    ["banana", "apple", "rice", "pork", "pot"]    [3, 2, 2, 2, 1]    ["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"]    3
//    ["apple"]    [10]    ["banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana"]    0

print(solution(["apple"], [10], ["banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana"]))
