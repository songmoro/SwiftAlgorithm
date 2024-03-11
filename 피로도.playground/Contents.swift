import Foundation

//    func solution(_ k: Int, _ dungeons: [[Int]]) -> Int {
//        return explore(k, dungeons, 0)
//    }
//
//    private func explore(_ k: Int, _ dungeons: [[Int]], _ depth: Int) -> Int {
//        return dungeons.map { dungeon in
//            k >= dungeon[0] ? explore(k - dungeon[1], dungeons.filter { elem in dungeon != elem }, depth + 1) : depth
//        }.max() ?? depth
//    }


func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result = 0
    var visited = [Bool](repeating: false, count: dungeons.count)
    
    func dfs(_ count: Int, _ fatigue: Int) {
        result = max(result, count)
        
        for i in 0..<dungeons.count {
            if !visited[i] && dungeons[i][0] <= fatigue {
                visited[i] = true
                dfs(count + 1, fatigue - dungeons[i][1])
                visited[i] = false
            }
        }
    }
    
    dfs(0, k)
    
    return result
}

print(solution(80, [[80,20],[50,40],[30,10]]))

//    k    dungeons    result
//    80    [[80,20],[50,40],[30,10]]    3

// dungeons
// a, b, c, d, e, f, g, h

// a
// b c d e f g h
// c
