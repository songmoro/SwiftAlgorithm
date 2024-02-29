import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var turn = [0, 0]
    var words = words
    var stack = [Character]()
    var duplication = Set<String>()
    
    while !words.isEmpty {
        let word = words.removeFirst()
        
        turn[0] = turn[0].quotientAndRemainder(dividingBy: n).remainder + 1
        turn[1] += turn[0] == 1 ? 1 : 0
        
        if stack.last == word.first || stack.isEmpty, duplication.insert(word).inserted {
            stack.append(word.last!)
        }
        else {
            return turn
        }
    }
    
    return [0, 0]
}

// i
// 0 1 2 3 4 5 6 7 8

// turn 0
// 1 2 3 1 2 3 1 2 3

// turn 1
// 1 1 1 2 2 2 3 3 3

//    n    words    result
//    3    ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]    [3,3]
//    5    ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"]    [0,0]
//    2    ["hello", "one", "even", "never", "now", "world", "draw"]    [1,3]

print(solution(2, ["hello", "one", "even", "never", "now", "world", "draw"]))
