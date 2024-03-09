import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var answer: [Int] = []
    var progresses = progresses
    var speeds = speeds
    
    while !progresses.isEmpty {
        for i in 0..<progresses.count {
            progresses[i] += speeds[i]
        }
        
        var count = 0
        while (progresses.first ?? 0) >= 100 {
            count += 1
            progresses.removeFirst()
            speeds.removeFirst()
        }
        
        if count != 0 {
            answer.append(count)
        }
    }
    
    return answer
}

print(solution([93, 30, 55], [1, 30, 5]))

//    progresses    speeds    return
//    [93, 30, 55]    [1, 30, 5]    [2, 1]
// 93 30   55
// 94 60   60
// 95 90   65
// 96 100  70
// 97      75
// 98      80
// 99      85
// 100     90
//         95
//        100

//    [95, 90, 99, 99, 80, 99]    [1, 1, 1, 1, 1, 1]    [1, 3, 2]
//  95  90  99  99  80  99
//  96  91 100 100  81 100
//  97  92          82
//  98  93          83
//  99  94          84
// 100  95          85
//      96          86
//      97          87
//      98          88
//      99          89
//     100          90
//                  91
//                  92
//                  93
//                  94
//                  95
//                  96
//                  97
//                  98
//                  99
//                 100

