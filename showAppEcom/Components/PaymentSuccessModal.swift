//
//  PaymentSuccessModal.swift
//  showAppEcom
//
//  Created by Taimoor Hamza on 21/07/2025.

import SwiftUI

struct PaymentSuccessModal: View {
    @Binding var isPresented: Bool
    var onBackToShopping: () -> Void
    var body: some View {
        if isPresented {
            ZStack {
            // Background Dim
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .transition(.opacity)
                // Modal content
                VStack(spacing: 24) {
                    Image("confetti") // Use your 3D icon asset name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)

                    Text("Your Payment Is")
                        .scaledFont(.cereal(20, weight: .bold))
                        .foregroundColor(.black)

                    Text("Successful")
                        .scaledFont(.cereal(20, weight: .bold))
                        .foregroundColor(.black)

                    Button(action: {
                        isPresented = false
                        onBackToShopping()
                    }) {
                        Text("Back To Shopping")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.lightPrimary)
                            .cornerRadius(30)
                    }
                    .padding(.horizontal)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(24)
                .frame(maxWidth: 300)
                .shadow(radius: 10)
            }
        }
    }
}
