import Foundation

func solution(_ elements:[Int]) -> Int {
    var numbers = Set<Int>()
    
    for i in 0..<elements.count {
        var number = 0
        
        for j in i..<(i + elements.count) {
            number += elements[j % elements.count]
            numbers.insert(number)
        }
    }
    
    return numbers.count
}

// [7]          [9]          [1]          [1]          [4]
// [7, 9]       [9, 1]       [1, 1]       [1, 4]       [4, 7]
// = 16 10 2 5 11
// [7, 9, 1]    [9, 1, 1]    [1, 1, 4]    [1, 4, 7]    [4, 7, 9]
// = 17 11 6 12 20
// [7, 9, 1, 1] [9, 1, 1, 4] [1, 1, 4, 7] [1, 4, 7, 9] [4, 7, 9, 1]
// = 18 15 13 21
// [7, 9, 1, 1, 4]

//    elements    result
//    [7,9,1,1,4]    18
//    1 = [1, 4, 7, 9]
//    2 = [2, 5, 10, 11, 16]
//    3 = [6, 11, 12, 17, 20]
//    4 = [13, 15, 18, 21]
//    5 = [22]
//    n = [1, 2, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 20, 21, 22]

print(solution([7,9,1,1,4]))
