import Foundation

func solution(_ s:String) -> [Int] {
    var answer = [0, 0]
    var s = s
    
    while(s != "1") {
        answer[0] += 1
        answer[1] += s.filter { $0 == "0" }.count
        
        s = String(s.filter { $0 == "1" }.count, radix: 2)
    }
    
    return answer
}

//    s    result
//    "110010101001"    [3,8]
//    111111 [1, 6] -> 110
//    11 [2, 7] -> 10
//    1 [3, 8]
//    "01110"    [3,3]
//    "1111111"    [4,1]

print(solution("1111111"))
