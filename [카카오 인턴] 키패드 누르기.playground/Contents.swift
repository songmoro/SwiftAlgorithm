import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var hand = hand.first!.uppercased()
    var left = 10
    var right = 12
    var dict = [2: [1: 1, 4: 2, 7: 3, 3: 1, 6: 2, 9: 3, 2: 0, 5: 1, 8: 2, 0: 3, 10: 4, 12: 4],
                5: [1: 2, 4: 1, 7: 2, 3: 2, 6: 1, 9: 2, 2: 1, 5: 0, 8: 1, 0: 2, 10: 3, 12: 3],
                8: [1: 3, 4: 2, 7: 1, 3: 3, 6: 2, 9: 1, 2: 2, 5: 1, 8: 0, 0: 1, 10: 2, 12: 2],
                0: [1: 4, 4: 3, 7: 2, 3: 4, 6: 3, 9: 2, 2: 3, 5: 2, 8: 1, 0: 0, 10: 1, 12: 1]]
    
    return numbers.reduce("") {
        print(left, right, $1)
        if [1, 4, 7].contains($1) {
            left = $1
            return $0 + "L"
        }
        else if [3, 6, 9].contains($1) {
            right = $1
            return $0 + "R"
        }
        else {
            if dict[$1]![left]! < dict[$1]![right]! {
                left = $1
                return $0 + "L"
            }
            else if dict[$1]![left]! > dict[$1]![right]! {
                right = $1
                return $0 + "R"
            }
            else {
                hand == "L" ? (left = $1) : (right = $1)
                return $0 + hand
            }
        }
    }
}

print(solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left"))
