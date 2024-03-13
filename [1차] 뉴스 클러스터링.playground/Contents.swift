func solution(_ str1:String, _ str2:String) -> Int {
    let str1 = str1.lowercased().reduce(into: [" "]) {
        $0.append("\($0.last!.last!)\($1)")
    }.filter {
        $0.first!.isLetter && $0.last!.isLetter
    }
    
    var str2 = str2.lowercased().reduce(into: [" "]) {
        $0.append("\($0.last!.last!)\($1)")
    }.filter {
        $0.first!.isLetter && $0.last!.isLetter
    }
    
    let a = str1.reduce(into: 0) { result, element in
        if str2.contains(element) {
            result += 1
            str2.remove(at: str2.firstIndex(of: element)!)
        }
    }
    
    if str1.count + str2.count == 0 {
        return 65536
    }
    else {
        return Int(Double(a) / Double(str1.count + str2.count) * 65536.0)
    }
}

print(solution("AAbbaa_AAbb", "BBB"))

//    str1    str2    answer
//    FRANCE    french    16384
//    handshake    shake hands    65536
//    aa1+aa2    AAAA12    43690
//    E=M*C^2    e=m*c^2    65536
