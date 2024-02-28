import Foundation

func solution(_ s:String) -> Int {
    var reversed = String(s.reversed())
    var answer = 0
    
    var x = reversed.last!
    var count1 = 0
    var count2 = 0
    
    while(!reversed.isEmpty) {
        switch(reversed.popLast()) {
        case x:
            count1 += 1
        default:
            count2 += 1
        }
        
        if count1 == count2 {
            x = reversed.last ?? "."
            answer += 1
            count1 = 0
            count2 = 0
        }
    }
    
    return x == "." ? answer : answer + 1
}

//    s    result
//    "banana"    3 "ba na na"
//    "abracadabra"    6 "ab ra ca da br a"
//    "aaabbaccccabba"    3 "aaabbacc ccab ba"

print(solution("abracadabra"))
