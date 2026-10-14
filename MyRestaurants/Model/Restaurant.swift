import Foundation

enum CardType {
    case poster
    case compact
}

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let rating: Double
    let address: String
    let image: String
    let desc: String
    let type: CardType
    var isFavorite: Bool = false
}


extension Restaurant {
    static let sampleData: [Restaurant] = [
        Restaurant(
            name: "을지로 골목식당",
            category: "한식",
            rating: 4.5,
            address: "서울 중구 을지로 12길",
            image: "korean1",
            desc: "korean1",
            type: .poster
        ),
        Restaurant(
            name: "파스타 공방",
            category: "양식",
            rating: 4.2,
            address: "서울 마포구 연남동 223",
            image: "pasta1",
            desc: "pasta1",
            type: .compact
        ),
        Restaurant(
            name: "카페 산책",
            category: "카페",
            rating: 4.7,
            address: "서울 성동구 성수동 44",
            image: "cafe1",
            desc: "cafe1",
            type: .compact
        ),
        Restaurant(
            name: "스시 오마카세",
            category: "일식",
            rating: 4.8,
            address: "서울 강남구 청담동 88",
            image: "sushi1",
            desc: "sushi1",
            type: .poster
        )
    ]
}
