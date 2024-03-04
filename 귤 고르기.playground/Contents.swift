import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var K = [k, 0]
    var box = tangerine.reduce(into: [:]) { partialResult, size in
        partialResult[size, default: 0] += 1
    }.values.sorted()
    
    while K[0] > 0 {
        K[0] -= box.removeLast()
        K[1] += 1
    }
    
    return K[1]
}

//    k    tangerine    result
//    6    [1, 3, 2, 5, 4, 5, 2, 3]    3
//    4    [1, 3, 2, 5, 4, 5, 2, 3]    2
//    2    [1, 1, 1, 1, 2, 2, 2, 3]    1

print(solution(4, [1, 3, 2, 5, 4, 5, 2, 3]))
