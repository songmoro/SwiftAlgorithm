import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    
    var dict: ([String: String], [String: Int]) = records.reduce(into: ([:], [:])) { partialResult, record in
        var record = record.split(separator: " ").map({ String($0) })
        
        let time = record[0]
        let number = record[1]
        
        if record[2] == "IN" {
            partialResult.0[number, default: ""] = time
        }
        else {
            let inTime = dateFormatter.date(from: partialResult.0[record[1]]!)!
            let outTime = dateFormatter.date(from: record[0])!
            
            partialResult.1[number, default: 0] += Int(outTime.timeIntervalSince(inTime) / 60)
            
            partialResult.0.removeValue(forKey: number)
        }
    }
    
    _ = dict.0.map {
        let inTime = dateFormatter.date(from: $0.value)!
        let outTime = dateFormatter.date(from: "23:59")!
        
        dict.1[$0.key, default: 0] += Int(outTime.timeIntervalSince(inTime) / 60)
    }
    
    return dict.1.keys.sorted(by: { $0 < $1 }).reduce(into: []) {
        let minTime = dict.1[$1]!
        let unitTime = (minTime - fees[0]).quotientAndRemainder(dividingBy: fees[2])
        let fee = (minTime >= fees[0]) ? (unitTime.quotient + (unitTime.remainder > 0 ? 1 : 0)) * fees[3] : 0

        $0.append(fees[1] + fee)
    }
}

print(solution([1, 461, 1, 10], ["00:00 1234 IN"]))

//    fees    records    result
//    [180, 5000, 10, 600]    ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]    [14600, 34400, 5000]
//    [120, 0, 60, 591]    ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"]    [0, 591]
//    [1, 461, 1, 10]    ["00:00 1234 IN"]    [14841]
