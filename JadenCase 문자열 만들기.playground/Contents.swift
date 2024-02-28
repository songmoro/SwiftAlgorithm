
func solution(_ s:String) -> String {
    s.dropFirst().reduce("\(s.first!.uppercased())") { partialResult, char in
        "\(partialResult)\(partialResult.last == " " ? char.uppercased() : char.lowercased())"
    }
}

//    s    return
//    "3people unFollowed me"    "3people Unfollowed Me"
//    "for the last week"    "For The Last Week"

print(solution("  for the last week"))
