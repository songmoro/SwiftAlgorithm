import Foundation

func solution(_ s:String) -> [Int] {
    let numbers = s.components(separatedBy: ["{", "}"]).map {
        $0.split(separator: ",").map({ Int($0)! })
    }.sorted(by: { $0.count < $1.count }).flatMap({ $0 })
    
    return numbers.reduce(into: Array<Int>()) {
        if !$0.contains($1) {
            $0.append($1)
        }
    }
}

//    s    result
//    "{{2},{2,1},{2,1,3},{2,1,3,4}}"    [2, 1, 3, 4]
//    "{{1,2,3},{2,1},{1,2,4,3},{2}}"    [2, 1, 3, 4]
//    "{{20,111},{111}}"    [111, 20]
//    "{{123}}"    [123]
//    "{{4,2,3},{3},{2,3,4,1},{2,3}}"    [3, 2, 4, 1]

print(solution("{{4,2,3},{3},{2,3,4,1},{2,3}}"))
