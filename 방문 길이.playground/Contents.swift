import Foundation

func solution(_ dirs:String) -> Int {
    var player = (x: 0, y: 0)
    
    return dirs.reduce(into: Set<[Int]>()) {
        let current = player
        switch $1 {
        case "U":
            player.y += player.y < 5 ? 1 : 0
        case "L":
            player.x += player.x < 5 ? 1 : 0
        case "R":
            player.x += player.x > -5 ? -1 : 0
        case "D":
            player.y += player.y > -5 ? -1 : 0
        default:
            break
        }
        
        if current != player {
            $0.insert([current.x, current.y, player.x, player.y])
            $0.insert([player.x, player.y, current.x, current.y])
        }
    }.count / 2
}

print(solution("UUUUUUUUUDDDDDDDDDD"))

//    "ULURRDLLU"    7
//    위 좌 위 오 오 아 왼 왼 위
//    0 0
//
//    1 0
//    1 1
//    2 1
//    2 0
//    2 -1
//    1 -1
//    1 0
//    1 1
//    2 1
//    "LULLLLLLU"    7
