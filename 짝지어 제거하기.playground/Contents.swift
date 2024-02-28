import Foundation

func solution(_ s:String) -> Int {
    var stack: [Character] = []
    
    s.map { character in
        stack.last == character ? _ = stack.removeLast() : stack.append(character)
    }
    
    return stack.isEmpty ? 1 : 0
}

//    s    result
//    baabaa    1
//    cdcd    0

print(solution("cdcd"))
