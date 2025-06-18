//
//  CustomButton.swift
//  showAppEcom
//
//  Created by Taimoor Hamza on 18/06/2025.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let backgroundColor: Color
    let foregroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(foregroundColor)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(backgroundColor)
                .cornerRadius(12)
        }
        .shadow(color: backgroundColor.opacity(0.3), radius: 8, x: 0, y: 4)
    }
}

struct CustomButtonSecondary: View {
    let title: String
    let borderColor: Color
    let foregroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(foregroundColor)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(borderColor, lineWidth: 2)
                )
        }
    }
}

struct CustomIconButton: View {
    let title: String
    let icon: String
    let backgroundColor: Color
    let foregroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 16, weight: .semibold))
                
                Text(title)
                    .font(.system(size: 18, weight: .semibold))
            }
            .foregroundColor(foregroundColor)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(backgroundColor)
            .cornerRadius(12)
        }
        .shadow(color: backgroundColor.opacity(0.3), radius: 8, x: 0, y: 4)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            CustomButton(
                title: "Sign In",
                backgroundColor: .blue,
                foregroundColor: .white,
                action: {}
            )
            
            CustomButtonSecondary(
                title: "Sign Up",
                borderColor: .blue,
                foregroundColor: .blue,
                action: {}
            )
            
            CustomIconButton(
                title: "Continue with Apple",
                icon: "applelogo",
                backgroundColor: .black,
                foregroundColor: .white,
                action: {}
            )
        }
        .padding()
    }
} 