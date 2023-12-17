import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var stack: [Int] = []
    var top: [Int] = Array(repeating: board.count - 1, count: board.count)
    
    for (i, arr) in board.enumerated() {
        for (j, ele) in arr.enumerated() {
            if ele != 0 {
                top[j] = min(top[j], i)
            }
        }
    }
    
    return moves.reduce(0) {
        if top[$1 - 1] <= board.count - 1 {
            let i = top[$1 - 1], j = $1 - 1
            top[$1 - 1] += 1
            
            if stack.suffix(1).contains(board[i][j]) {
                stack.removeLast()
                return $0 + 2
            }
            else {
                stack.append(board[i][j])
            }
        }
        return $0
    }
}

print(solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))
