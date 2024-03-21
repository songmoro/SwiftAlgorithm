func solution(_ msg:String) -> [Int] {
    var msg = [" "] + msg.reversed().map({ String($0) })
    var dict = " ABCDEFGHIJKLMNOPQRSTUVWXYZ".enumerated().reduce(into: [:]) {
        $0[String($1.element)] = $1.offset
    }
    
    var answer = ([Int](), "")
    
    while !msg.isEmpty  {
        answer.1 += msg.removeLast()
        
        if dict[answer.1] == nil {
            answer.0.append(dict["\(answer.1.dropLast())"]!)
            dict[answer.1] = dict.max(by: { $0.value < $1.value })!.value + 1
            answer.1 = "\(answer.1.last!)"
        }
    }
    
    return answer.0
}

print(solution("ABABABABABABABAB"))

//    msg    answer
//    KAKAO    [11, 1, 27, 15]
// K
// A
// KA
// O
//    TOBEORNOTTOBEORTOBEORNOT    [20, 15, 2, 5, 15, 18, 14, 15, 20, 27, 29, 31, 36, 30, 32, 34]
//    ABABABABABABABAB    [1, 2, 27, 29, 28, 31, 30]
