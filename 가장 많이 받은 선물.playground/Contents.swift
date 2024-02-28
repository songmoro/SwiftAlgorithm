import Foundation

var friends = ["a", "b", "c"]
var gifts = ["a b", "b a", "c a", "a c", "a c", "c a"]

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    // 2차원 테이블 생성
    //   a b c 합
    // a 0 0 0 0
    // b 0 0 0 0
    // c 0 0 0 0
    var table = Array(repeating: Array(repeating: 0, count: friends.count + 1), count: friends.count)
    
    // 인덱싱 용 딕셔너리
    var index: [String: Int] = [:]
    
    // 인덱싱 매핑
    _ = friends.reduce(0) { partialResult, friend in
        index[friend] = partialResult
        
        return partialResult + 1
    }
    
    // 테이블 매핑
    gifts.map {
        let i = index[String($0.split(separator: " ").first!)]!
        let j = index[String($0.split(separator: " ").last!)]!
        
        table[i][j] += 1
        table[i][friends.count] += 1
        table[j][friends.count] -= 1
    }
    
    // 최대 선물 개수 반환
    return friends.reduce(0) { partialResult, friend in
        let i = index[friend]!
        
        var count = 0
        for j in 0..<friends.count {
            if i == j {
                continue
            }
            
            if table[i][j] > table[j][i] {
                count += 1
            }
            else if table[i][j] == table[j][i], table[i][friends.count] > table[j][friends.count] {
                count += 1
            }
        }
        
        return max(partialResult, count)
    }
}

solution(friends, gifts)
