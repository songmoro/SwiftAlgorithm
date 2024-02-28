import Foundation

func solution(_ s:String) -> Bool {
    var stack: [Character] = []
    
    s.map { bracket in
        stack.last == "(" && bracket == ")" ? _ = stack.removeLast() : stack.append(bracket)
    }
    
    return stack.isEmpty
}

//    s    answer
//    "()()"    true
//    "(())()"    true
//    ")()("    false
//    "(()("    false

print(solution("()()"))
