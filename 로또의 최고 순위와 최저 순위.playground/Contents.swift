import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var win = win_nums.reduce(1) { partialResult, num in
        return lottos.contains(num) ? partialResult : min(partialResult + 1, 6)
    }
    
    return [max(1, win - lottos.filter({ $0 == 0 }).count), win]
}

print(solution([45, 4, 35, 20, 3, 9], [20, 9, 3, 45, 4, 35]))
