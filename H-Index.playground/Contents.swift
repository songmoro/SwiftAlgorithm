import Foundation

func solution(_ citations:[Int]) -> Int {
    for i in 0...citations.count {
        if citations.filter({ $0 > i }).count <= i {
            return i
        }
    }
    
    return 0
}

//    citations    return
//    [3, 0, 6, 1, 5]    3

print(solution([0]))
