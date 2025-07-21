import SwiftUI

struct BottomTabBar: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "house.fill")
            Spacer()
            Image(systemName: "heart")
            Spacer()
            Image(systemName: "bag")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
            Spacer()
            Image(systemName: "bell")
            Spacer()
            Image(systemName: "person")
            Spacer()
        }
        .padding(.top)
    }
}
