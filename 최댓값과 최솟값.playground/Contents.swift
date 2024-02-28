func solution(_ s:String) -> String {
    var numbers = Set(s.split(separator: " ").map { Int($0)! })
    
    return "\(numbers.min()!) \(numbers.max()!)"
}

//    s    return
//    "1 2 3 4"    "1 4"
//    "-1 -2 -3 -4"    "-4 -1"
//    "-1 -1"    "-1 -1"

print(solution("-1 -1"))

