import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var a = a
    var b = b
    var count = 0
    
    while a != b {
        count += 1
        a = (a.isMultiple(of: 2) ? a : a + 1) / 2
        b = (b.isMultiple(of: 2) ? b : b + 1) / 2
    }
    
    return count
}

//    N    A    B    answer
//    8    4    7    3

print(solution(8, 4, 7))
