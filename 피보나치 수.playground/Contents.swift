func solution(_ n:Int) -> Int {
    var F = [0, 1]
    
    for i in 2...n {
        F.append((F[i - 2] + F[i - 1]).quotientAndRemainder(dividingBy: 1234567).remainder)
    }
    
    return F.last!
}

//    n    return
//    3    2
//    5    5

print(solution(100000))
