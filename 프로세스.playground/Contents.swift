import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var current = 1
    var priorities = priorities
    var process = [Int](repeating: 0, count: priorities.count)
    
    while priorities.max()! != 0 {
        priorities.enumerated().forEach {
            if $0.element == priorities.max()!, $0.element != 0 {
                process[$0.offset] = current
                current += 1
                priorities[$0.offset] = 0
            }
        }
    }
    
    return process[location]
}

print(solution([2, 1, 3, 2], 2))

//    priorities    location    return
//    [2, 1, 3, 2]    2    1
// 2 3 1 2
//    [1, 1, 9, 1, 1, 1]    0    5
// 2 3 4 5 0 1
