//
//  SignInView.swift
//  showAppEcom
//
//  Created by Taimoor Hamza on 18/06/2025.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isSecured = true
//    init(){
//        for family in UIFont.familyNames {
//            print("Family: \(family)")
//            for name in UIFont.fontNames(forFamilyName: family) {
//                print("  Font: \(name)")
//            }
//        }
//    }
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
            .padding(.top, UIScreen.main.bounds.height * 0.05)
            .padding(.leading, 5)
            Spacer().frame(height:40)

            VStack(spacing: 30) {     
                Text("Hello Again!")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.black)
                
                Text("Welcome Back You’ve Been Missed!")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.lightSubText)
                
                Spacer().frame(height: 20)
                
                VStack(spacing: 20) {
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
                
                Spacer().frame(height: 10)
                
                // Login Button
                CustomButton(
                    title: "Sign In",
                    backgroundColor: .lightPrimary,
                    foregroundColor: .white,
                    action: {
                        // Handle login
                        print("Login tapped with email: \(email)")
                    }
                )
                .padding(.horizontal, 30)
                
                // Sign Up Link
                HStack {
                    Text("Don't have an account?")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.8))
                    
                    Button("Sign Up") {
                        // Handle sign up
                    }
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                }
                .padding(.top, 20)
                
            
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
} 
