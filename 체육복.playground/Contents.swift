import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var lost = lost
    var reserve = reserve
    
    // 여벌 있는 학생 도난 제거
    lost.map { number in
        if reserve.contains(number) {
            lost.removeAll {
                $0 == number
            }
            reserve.removeAll {
                $0 == number
            }
        }
    }
    
    // 배열 정렬
    lost.sort(by: <)
    reserve.sort(by: <)
    
    return lost.reduce(n) { partialResult, number in
        if reserve.contains(number - 1) {
            reserve.removeAll {
                $0 == (number - 1)
            }
            
            return partialResult
        }
        else if reserve.contains(number + 1) {
            reserve.removeAll {
                $0 == (number + 1)
            }
            
            return partialResult
        }
        
        return partialResult - 1
    }
}

print(solution(5, [2, 4], [3]))
