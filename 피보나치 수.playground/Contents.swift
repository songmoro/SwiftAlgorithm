func solution(_ n:Int) -> Int {
    var F = [0, 1]
    
    while F.count <= n {
        F.append((F[F.endIndex - 2] + F.last!).quotientAndRemainder(dividingBy: 1234567).remainder)
    }
    
    return F[n]
}

//    n    return
//    3    2
//    5    5

print(solution(6))
