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
//class Solution {
//    fun solution(citations: IntArray): Int {
//        var answer = 0
//        val list = mutableListOf<Int>()
//        for (i in citations.indices) {
//            if (citations.count {
//              it >= i + 1
//              } >= i + 1) list.add(i + 1)
//        }
//        answer = if (list.isEmpty()) 0 else list.last()
//        return answer
//    }
//}
