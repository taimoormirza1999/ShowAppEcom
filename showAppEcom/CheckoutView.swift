//
//  CheckoutView.swift
//  showAppEcom
//
//  Created by Taimoor Hamza on 21/07/2025.
//

import SwiftUI

struct CheckoutView: View {
    @State private var showSuccessModal = false
    var body: some View {
         ZStack {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            HStack {
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                }

                Spacer()

                Text("Checkout")
                    .font(.title2.bold())

                Spacer()
            }
            .padding(.horizontal)

            // Contact Info Card
            VStack(alignment: .leading, spacing: 16) {
                Text("Contact Information")
                    .font(.headline)

                HStack {
                    Image(systemName: "envelope")
                        .padding(10)
                        .background(Color.lightFrameColor)
                        .cornerRadius(12)

                    VStack(alignment: .leading) {
                        Text("rumenhussen@gmail.com")
                        Text("Email")
                            .font(.caption)
                            .foregroundColor(.lightSubText)
                    }
                    Spacer()
                    Image(systemName: "pencil")
                        .foregroundColor(.gray)
                }

                HStack {
                    Image(systemName: "phone")
                        .padding(10)
                        .background(Color.lightFrameColor)
                        .cornerRadius(12)

                    VStack(alignment: .leading) {
                        Text("+88-692 -764-269")
                        Text("Phone")
                            .font(.caption)
                            .foregroundColor(.lightSubText)
                    }
                    Spacer()
                    Image(systemName: "pencil")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .padding(.horizontal)

            // Address
            VStack(alignment: .leading, spacing: 8) {
                Text("Address")
                    .font(.headline)
                Text("Newahall St 36, London, 12908 - UK")
                    .font(.subheadline)
                    .foregroundColor(.lightSubText)

                Image("map")
                    .resizable()
                    .frame(height: 100)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            // Payment Method
            VStack(alignment: .leading, spacing: 12) {
                Text("Payment Method")
                    .font(.headline)

                HStack(spacing: 12) {
                    Image("paypal")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(8)
                    VStack(alignment: .leading) {
                        Text("Paypal Card")
                        Text("**** **** 0696 4629")
                            .font(.caption)
                            .foregroundColor(.lightSubText)
                    }
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .padding(.horizontal)

            Spacer()

            // Summary and Payment
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Subtotal")
                        .foregroundColor(.lightSubText)
                    Spacer()
                    Text("$1250.00")
                        .bold()
                }
                HStack {
                    Text("Shopping")
                        .foregroundColor(.lightSubText)
                    Spacer()
                    Text("$40.90")
                        .bold()
                }
                Divider()
                HStack {
                    Text("Total Cost")
                        .font(.headline)
                    Spacer()
                    Text("$1690.99")
                        .font(.title3.bold())
                }
                Button(action: {
                    print("🪵 Payment Button Tapped")
                }) {
                    Text("Payment")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.lightPrimary)
                        .cornerRadius(30)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(30)
            .padding(.horizontal)
        }
         VStack {
                Spacer()
                Button("Simulate Payment") {
                    showSuccessModal = true
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.lightPrimary)
                .foregroundColor(.white)
                .cornerRadius(30)
                .padding()
            }

            // Modal Overlay
            PaymentSuccessModal(isPresented: $showSuccessModal) {
                print("🎉 Navigated back to shopping")
                // Add real navigation logic here
            }
        
        .background(Color(.systemGray6).ignoresSafeArea())

        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
