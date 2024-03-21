func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var i = 0
    var queue = [String]()
    var tube = [String]()
    
    while ((queue.count)) <= (m * t) {
        String(i, radix: n, uppercase: true).map {
            queue.append(String($0))
        }
        
        i += 1
    }
    
    for j in stride(from: (p - 1), to: queue.count, by: m) {
        tube.append(String(queue[j]))
    }
    
    return tube[0..<t].joined()
}

print(solution(16, 16, 2, 2))

// n 진법, t 숫자 갯수, m 인원, p 튜브 순서
//    n    t    m    p    result
//    2    4    2    1    "0111"
// 0 1 2 3 4 -> 0 1 10 11 100
// 0 1 1 0 1 1 1 0 0
// 0 x 1 x 1 x 1 x 0 -> 0 1 1 1

//    16    16    2    1    "02468ACE11111111"
// 02468ace111111111
// 02468ACE111111111
//    16    16    2    2    "13579BDF01234567"
// 13579BDF01234567
// 13579BDF012345678
