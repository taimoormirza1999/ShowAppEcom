//
//  CustomInputField.swift
//  showAppEcom
//
//  Created by Taimoor Hamza on 18/06/2025.
//

import SwiftUI

struct CustomInputField: View {
    let placeholder: String
    @Binding var text: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.lightSubText.opacity(0.7))
                .frame(width: 20)
            
            TextField(placeholder, text: $text)
                .foregroundColor(.lightSubText)
                .placeholder(when: text.isEmpty) {
                    Text(placeholder)
                        .foregroundColor(.lightSubText.opacity(0.7))
                }
        }
        .padding()
        .background(
            Capsule()
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
    }
}

struct CustomInputFieldWithLabel: View {
    let placeholder: String
    let label: String
    @Binding var text: String
    let icon: String
    
    var body: some View {
        VStack(){
            Text(label).scaledFont(.cereal(36, weight: .bold))
                .foregroundColor(.black)
                
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.lightSubText.opacity(0.7))
                    .frame(width: 20)
                
                TextField(placeholder, text: $text)
                    .foregroundColor(.lightSubText)
                    .placeholder(when: text.isEmpty) {
                        Text(placeholder)
                            .foregroundColor(.lightSubText.opacity(0.7))
                    }
            }
            .padding()
            .background(
                Capsule()
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
            )
        }
    }
}

struct CustomPasswordField: View {
    let placeholder: String
    @Binding var text: String
    @Binding var isSecured: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "lock.fill")
                .foregroundColor(.lightSubText.opacity(0.7))
                .frame(width: 20)
            
            if isSecured {
                SecureField(placeholder, text: $text)
                    .foregroundColor(.lightSubText)
            } else {
                TextField(placeholder, text: $text)
                    .foregroundColor(.white)
            }
            
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: isSecured ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(.white.opacity(0.7))
            }
        }
        .padding()
        .background(
            Capsule()
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
               
        )
    }
}

// Extension to add placeholder modifier
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
        
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomInputField(placeholder: "Email", text: .constant(""), icon: "envelope.fill")
            CustomPasswordField(placeholder: "Password", text: .constant(""), isSecured: .constant(true))
        }
        .padding()
        .background(Color.blue)
    }
} 
