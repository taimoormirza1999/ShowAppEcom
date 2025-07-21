//
//  CartView.swift
//  showAppEcom
//
//  Created by Taimoor Hamza on 21/07/2025.
//

import SwiftUI

struct CartView: View {
    @State private var quantities = [1, 1, 1] // Just static quantities for now
    @State private var navigateToHome = false
    @State private var navigateToCheckout = false
    var body: some View {
        NavigationStack {
        VStack(spacing: 16) {
            // Header
            HStack {
                Button(action: {
                    print("🪵 Back Button Tapped")
                    navigateToHome = true
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                }

                Spacer()

                Text("My Cart")
                    .scaledFont(.cereal(20, weight: .bold))

                Spacer()

                Spacer().frame(width: 48) // Placeholder to balance back button
            }
            .padding(.horizontal)

            // Cart Items
            ScrollView {
                VStack(spacing: 10) {
                    CartItemView(
                        imageName: "shoe1",
                        title: "Nike Club Max",
                        price: "$64.95",
                        size: "L",
                        quantity: $quantities[0],
                        onDelete: {}
                    )
                    // CartItemView(
                    //     imageName: "shoe2",
                    //     title: "Nike Air Max 200",
                    //     price: "$64.95",
                    //     size: "XL",
                    //     quantity: $quantities[1],
                    //     onDelete: {}
                    // )
                    // CartItemView(
                    //     imageName: "shoe3",
                    //     title: "Nike Air Max",
                    //     price: "$64.95",
                    //     size: "XXL",
                    //     quantity: $quantities[2],
                    //     onDelete: {}
                    // )
                }
            }

            // Summary Section
            VStack(spacing: 12) {
                HStack {
                    Text("Subtotal")
                        .foregroundColor(.lightSubText)
                        .scaledFont(.cereal(14))
                    Spacer()
                    Text("$1250.00")
                        .scaledFont(.cereal(14, weight: .medium))
                }
                HStack {
                    Text("Shopping")
                        .foregroundColor(.lightSubText)
                        .scaledFont(.cereal(14))
                    Spacer()
                    Text("$40.90")
                        .scaledFont(.cereal(14, weight: .medium))
                }
                Divider()
                HStack {
                    Text("Total Cost")
                        .scaledFont(.cereal(16, weight: .bold))
                    Spacer()
                    Text("$1690.99")
                        .scaledFont(.cereal(16, weight: .bold))
                }

                Button(action: {
                    print("🪵 Checkout button tapped")
                    navigateToCheckout = true
                }) {
                    Text("Checkout")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.lightPrimary)
                        .clipShape(Capsule())
                }
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding(.horizontal)
        }
        .background(Color(.systemGray6).ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $navigateToHome) {
            HomeView()
        }
        .navigationDestination(isPresented: $navigateToCheckout) {
            CheckoutView()
        }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
