import Foundation

func solution(_ s:String) -> Bool {
    var stack: [Character] = []
    
    s.map { bracket in
        switch stack.last {
        case "(":
            bracket == ")" ? stack.removeLast(1) : stack.append(bracket)
        default:
            stack.append(bracket)
        }
    }
    
    return stack.isEmpty
}

//    s    answer
//    "()()"    true
//    "(())()"    true
//    ")()("    false
//    "(()("    false

print(solution("()()"))
