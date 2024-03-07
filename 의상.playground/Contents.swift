import Foundation

func solution(_ clothes:[[String]]) -> Int {
    clothes.reduce(into: [:], { $0[$1.last!, default: 0] += 1 }).values.reduce(into: 1, { $0 *= ($1 + 1) }) - 1
}

print(solution([["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]]))

//    clothes    return
//    [["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]    5
//    [["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]]    3

// (1) (3)
// (0) (0) - 1
// (0) (1)
// (0) (2)
// (0) (3)
// (1) (0)
// (1) (1)
// (1) (2)
// (1) (3)

//    1. yellow_hat
//    2. blue_sunglasses
//    3. green_turban
//    4. yellow_hat + blue_sunglasses
//    5. green_turban + blue_sunglasses

// (3)
// (0) - 1
// (1)
// (2)
// (3)


