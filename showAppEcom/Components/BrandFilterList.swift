import SwiftUI
struct BrandFilterList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
                  HStack(spacing: 12) {
                      ForEach(["Nike", "Puma", "Adidas", "Converse", "UA"], id: \.self) { brand in
                          Text(brand)
                              .padding(.horizontal)
                              .padding(.vertical, 8)
                              .background(Color.green.opacity(0.1))
                              .cornerRadius(20)
                      }
                  }
              }
        
    }
    
}
