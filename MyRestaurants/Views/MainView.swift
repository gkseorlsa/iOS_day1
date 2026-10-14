import SwiftUI

struct MainView: View {
    let restaurants = Restaurant.sampleData
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(restaurants) { restaurant in
                    RestaurantCard(restaurant: restaurant)
                }
            }
            .padding()
        }
    }
}

#Preview {
    MainView()
}

