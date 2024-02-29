func solution(_ arr:[Int]) -> Int {
    var i = 1
    
    while arr.map({(arr.max()! * i).isMultiple(of: $0)}).contains(false) { i += 1 }
    
    return arr.max()! * i
}

//    arr    result
//    [2,6,8,14]    168
//    [1,2,3]    6
//    [1,2,3,4,5,6,7] 60

print(solution([1, 2, 3, 4, 5, 6]))
