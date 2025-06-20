
//
//  RegisterView.swift
//  showAppEcom
//
//  Created by Taimoor Hamza on 18/06/2025.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isSecured = true

    var body: some View {
        
        
        ZStack(alignment: .topLeading) {
            
            Color.lightFrameColor.ignoresSafeArea()
            
            Button(action: {
                // your action
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.lightSubText)
                    .padding()
            }
            .padding(.top, UIScreen.main.bounds.height * 0.01)
            .padding(.leading, UIScreen.main.bounds.width *
                     0.03)
           

            VStack(spacing: 30) {
                Spacer().frame(height:40)
                Text("Create Account")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.black)
                
                Text("Let’s Create Account Together")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.lightSubText)
                
                
                
                VStack(spacing: 20) {
                    Spacer().frame(height: 0)
                    // Email Input
                    CustomInputField(
                        placeholder: "Email",
                        text: $email,
                        icon: "envelope.fill"
                    )
                    
                    // Password Input
                    CustomPasswordField(
                        placeholder: "Password",
                        text: $password,
                        isSecured: $isSecured
                    )
                    
                    // Forgot Password
                    HStack {
                        Spacer()
                        Button("Forgot Password?") {
                            // Handle forgot password
                        }
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.lightSubText)
                    }
                }
                .padding(.horizontal, 30)
                
               
                
                // Login Button
                CustomButton(
                    title: "Sign Up",
                    backgroundColor: .lightPrimary,
                    foregroundColor: .white,
                    action: {
                        // Handle login
                        print("Login tapped with email: \(email)")
                    }
                )
                .padding(.horizontal, 30)
                
                CustomIconButton(
                    title: "Continue with Google",
                    icon: "applelogo",
                    backgroundColor: .black,
                    foregroundColor: .white,
                    action: {}
                ).padding(.horizontal, 30)
                
                // Sign in Link
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14))
                        .foregroundColor(.lightSubText.opacity(0.8))
                    
                    Button("Sign in") {
                        // Handle sign in
                    }
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.black)
                }
                .padding(.top, 20)
                
            
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView().padding(.horizontal, UIScreen.main.bounds.width * 0.01)
    }
} 
