import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    let a = A.sorted(by: <)
    let b = B.sorted(by: >)
    
    return a.enumerated().reduce(0) { partialResult, element in
        partialResult + element.element * b[element.offset]
    }
}

//    A    B    answer
//    [1, 4, 2]    [5, 4, 4]    29
//    [1,2]    [3,4]    10

print(solution([1, 4, 2], [5, 4, 4]))
