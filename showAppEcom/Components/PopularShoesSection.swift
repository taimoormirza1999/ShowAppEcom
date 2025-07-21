//
//  PopularShoesSection.swift
//  showAppEcom
//
//  Created by Taimoor Hamza on 21/07/2025.
//

import SwiftUI

struct PopularShoesSection: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Popular Shoes").bold()
                Spacer()
                Text("See all").foregroundColor(.blue)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<5) { _ in
                        ShoeCardView()
                    }
                }
            }
        }
    }
}

struct NewArrivalsSection: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("New Arrivals").bold()
                Spacer()
                Text("See all").foregroundColor(.blue)
            }
            ShoeCardView()
        }
    }
}

struct ShoeCardView: View {
    var body: some View {
          NavigationLink(destination: ProductDetailView(productID: "12345")) {
        VStack {
            Rectangle().fill(Color.gray).frame(height: 100)
            Text("Nike Jordan").bold()
            Text("$493.00").foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        }
    }
}
