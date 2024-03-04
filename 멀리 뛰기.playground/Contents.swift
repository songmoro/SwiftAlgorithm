func solution(_ n:Int) -> Int {
    var F = [0, 1, 2]
    
    while F.count <= n {
        F.append((F[F.endIndex - 2] + F.last!).quotientAndRemainder(dividingBy: 1234567).remainder)
    }
    
    return F[n]
}

//    n    result
//    4    5
//    3    3

print(solution(5))

// 1 = 1
// 1

// 2 = 2
// 1 2
//   2

// 3 = 3
// 1 2 3
// 1   3
//   2 3

// 4 = 5
// 1 2 3 4
// 1 2   4
// 1   3 4

//   2 3 4
//   2   4

// 5 = 8
// 1 2 3 4 5
// 1 2 3   5
// 1 2   4 5
// 1   3 4 5
// 1   3   5
//   2 3 4 5
//   2 3   5
//   2   4 5

// 6 = 13
// 1 2 3 4 5 6
// 1 2 3 4   6
// 1 2 3   5 6
// 1 2   4 5 6
// 1 2   4   6
// 1   3 4 5 6
// 1   3   5 6
//   2 3 4 5 6
//   2 3 4   6
//   2 3   5 6
//   2   4 5 6
//   2   4   6
