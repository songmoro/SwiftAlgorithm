import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var boardCount = board.count
    var stack: [Int] = []
    var top: [Int] = Array(repeating: boardCount - 1, count: boardCount)
    
    for (i, arr) in board.enumerated() {
        for (j, ele) in arr.enumerated() {
            if ele != 0 {
                top[j] = min(top[j], i)
            }
        }
    }
    
    return moves.reduce(0) {
        let i = top[$1 - 1]
        
        if i <= boardCount - 1 {
            let j = $1 - 1
            let last = board[i][j]
            
            stack.append(last)
            top[$1 - 1] += 1
            
            if stack.suffix(2).map({ String($0) }).joined() == "\(last)\(last)" {
                stack.removeLast(2)
                return $0 + 2
            }
        }
        return $0
    }
}

print(solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))
