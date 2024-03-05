import Foundation

func solution(_ s:String) -> Int {
    let s = s.map({ String($0) })
    
    return s.enumerated().reduce(into: 0) { partialResult, element in
        var stack = [Character]()
        
        (s[element.offset...] + s.prefix(element.offset)).map { bracket in
            if stack.last == "(" && bracket == ")" || stack.last == "[" && bracket == "]" || stack.last == "{" && bracket == "}" {
                stack.removeLast()
            }
            else {
                stack.append(contentsOf: bracket)
            }
        }
        
        partialResult += stack.isEmpty ? 1 : 0
    }
}

//    s    result
//    "[](){}"    3
//    "}]()[{"    2
//    "[)(]"    0
//    "}}}"    0

print(solution("[](){}"))
