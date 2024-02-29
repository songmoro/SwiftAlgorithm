import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let brown = Double(brown)
    let yellow = Double(yellow)
    
    let width = Int((brown / 2 - 2 + sqrt((pow((brown / 2) - 2, 2) - 4 * yellow))) / 2)
    let height = Int(yellow) / width
    
    return [width + 2, height + 2]
}

// width = (brown / 2 - 2 + sqrt((brown / 2 - 2) ^ 2 - 4 * yellow)) / 2

//    brown    yellow    return
//    10    2    [4, 3]
//    8    1    [3, 3]
//    24    24    [8, 6]

print(solution(8, 1))
