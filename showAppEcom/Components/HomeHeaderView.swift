//
//  HomeHeaderView.swift
//  showAppEcom
//
//  Created by Taimoor Hamza on 21/07/2025.
//

import SwiftUI

struct HomeHeaderView: View {
    @State private var navigateToCart = false
    var body: some View {
        HStack {
                   Image(systemName: "square.grid.2x2")
                   VStack(alignment: .leading) {
                       Text("Store location")
                           .font(.caption)
                           .foregroundColor(.gray)
                       Text("Mondolibug, Sylhet")
                           .font(.subheadline)
                           .bold()
                   }
                   Spacer()
                Button(action: {
                            print("🪵 Cart Button Tapped")
                            navigateToCart = true
                        }) {
                            Image( "cart")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        }
               }
        .navigationDestination(isPresented: $navigateToCart) {
            CartView()
        }
    }
    
}
