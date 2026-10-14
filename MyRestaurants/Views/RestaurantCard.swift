import SwiftUI

struct RestaurantCard: View {
    let restaurant: Restaurant
    @State private var isFavorite = false
    
    var body: some View {
        switch restaurant.type {
        case .poster:
            posterCard
        case .compact:
            compactCard
        }
    }
    
    var posterCard: some View {
        // 상단: 이미지 + 즐겨찾기 버튼
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topTrailing) {
                Color.clear
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
                    .overlay(
                        Image(restaurant.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    )
                    .clipped()
                
                Button(action: {
                    isFavorite.toggle()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(isFavorite ? .red : .white)
                        .font(.system(size: 20))
                        .padding(10)
                }
            }
            
            // 하단: 맛집 정보
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(restaurant.name)
                        .font(.headline)
                    Spacer()
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                            .font(.caption)
                        Text(String(format: "%.1f", restaurant.rating))
                            .font(.caption)
                            .fontWeight(.bold)
                    }
                }
                
                Text(restaurant.category)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(Color.orange.opacity(0.15))
                    .cornerRadius(4)
                
                Text(restaurant.address)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(12)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
    }
    
    var compactCard: some View {
        HStack(spacing: 12) {
            // 좌측: 작은 이미지
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipped()
                .cornerRadius(10)
            
            // 중앙: 맛집 정보
            VStack(alignment: .leading, spacing: 4) {
                Text(restaurant.name)
                    .font(.headline)
                HStack(spacing: 4) {
                    Text(restaurant.category)
                        .font(.caption)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.orange.opacity(0.15))
                        .cornerRadius(4)
                    
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                            .font(.caption2)
                        
                        Text(String(format: "%.1f", restaurant.rating))
                            .font(.caption2)
                    }
                }
                
                Text(restaurant.address)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // 우측: 즐겨찾기 버튼
            Button(action: {
                isFavorite.toggle()
            }) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(isFavorite ? .red : .gray)
                    .font(.system(size: 20))
            }
            .buttonStyle(.plain)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
    }
}


#Preview("포스터") {
    RestaurantCard(
        restaurant: Restaurant(
            name: "을지로 골목식당",
            category: "한식",
            rating: 4.5,
            address: "서울 중구 을지로 12길",
            image: "korean1",
            desc: "korean1",
            type: .poster
        )
    )
    .padding()
}

#Preview("컴팩트") {
    RestaurantCard(
        restaurant: Restaurant (
            name: "파스타 공방",
            category: "양식",
            rating: 4.2,
            address: "서울 마포구 연남동 223",
            image: "pasta1",
            desc: "pasta1",
            type: .compact
        )
    )
    .padding()
}
