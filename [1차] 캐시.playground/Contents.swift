func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache: [String] = []
    
    return cities.map({ $0.lowercased() }).reduce(into: 0) { time, city in
        if cache.contains(city) {
            cache = cache.filter({ $0 != city })
            time += 1
        }
        else {
            time += 5
        }
        
        cache.append(city)
        cache = cache.suffix(cacheSize)
    }
}

//    캐시크기(cacheSize)    도시이름(cities)    실행시간
//    3    ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]    50
//    3    ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]    21
//    2    ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]    60
//    5    ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]    52
//    2    ["Jeju", "Pangyo", "NewYork", "newyork"]    16
// [jeju], [jeju, pangyo], [pangyo, newyork], [pangyo, newyork]
// 5, 10, 15, 11
//    0    ["Jeju", "Pangyo", "Seoul", "NewYork", "LA"]    25

print(solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))
