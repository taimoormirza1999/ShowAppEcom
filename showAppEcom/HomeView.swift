import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
        VStack(spacing: 16) {
            HomeHeaderView()
            HomeSearchBar()
            BrandFilterList()
            PopularShoesSection()
            NewArrivalsSection()
            Spacer()
            BottomTabBar()
        }
        .padding(.horizontal)
        .background(Color(.systemGray6))
        .navigationBarBackButtonHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
