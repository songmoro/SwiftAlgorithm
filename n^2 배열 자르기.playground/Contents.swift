import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    (left...right).map {
        Int(max($0 / Int64(n) + 1, $0 % Int64(n) + 1))
    }
}

//    n    left    right    result
//    3    2    5    [3,2,2,3]
//    4    7    14    [4,3,3,3,4,4,4,4]

print(solution(3, 2, 5))
