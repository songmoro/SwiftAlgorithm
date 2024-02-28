import Foundation

func solution(_ n:Int) -> Int {
    var N = n + 1
    
    while(n.nonzeroBitCount != N.nonzeroBitCount) { N += 1 }
    
    return N
}

//    n    result
//    78    83
//    15    23

print(solution(78))
