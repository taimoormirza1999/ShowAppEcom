//
//  OnboardingView.swift
//  showAppEcom
//
//  Created by Assistant on 18/06/2025.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selectedTab = 0
    @State private var isOnboardingComplete = false
    
    var body: some View {
        NavigationStack {
            ZStack {
              
                  
                TabView(selection: $selectedTab) {
          
                    OnboardingPage(
                        title: AppConstants.Onboarding.title1,
                        subtitle: AppConstants.Onboarding.subtitle1,
                        imageName: "shoe1",
                        selectedTab: $selectedTab,
                        isOnboardingComplete: $isOnboardingComplete
                    )
                    .tag(0)
                    
                    OnboardingPage(
                        title: AppConstants.Onboarding.title2,
                        subtitle: AppConstants.Onboarding.subtitle2,
                        imageName: "shoe2",
                        selectedTab: $selectedTab,
                        isOnboardingComplete: $isOnboardingComplete
                    )
                    .tag(1)
                    
                    OnboardingPage(
                        title: AppConstants.Onboarding.title3,
                        subtitle: AppConstants.Onboarding.subtitle3,
                        imageName: "shoe3",
                        selectedTab: $selectedTab,
                        isOnboardingComplete: $isOnboardingComplete
                    )
                    .tag(2)
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .padding(.bottom, 40)
                VStack {
                    HStack {
                        Button(action: {
                            print("🪵 Back Button Tapped")
                            isOnboardingComplete = true
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        Spacer()
                    }
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                    .padding(.top, UIScreen.main.bounds.height * 0.0)

                    Spacer()
                }

                
                NavigationLink(destination: SignInView(), isActive: $isOnboardingComplete) {
                    EmptyView()
                }.hidden()
                .navigationBarBackButtonHidden(true)
               
            }
        }
    }
}

struct OnboardingPage: View {
    let title: String
    let subtitle: String
    let imageName: String
    @Binding var selectedTab: Int
    @Binding var isOnboardingComplete: Bool
    var body: some View {
        VStack(spacing: 16) {
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(.horizontal, 20)
                .offset(y:UIScreen.main.bounds.height*0.1)

            VStack(alignment: .center, spacing: 12) {
                Text(title)
                    .scaledFont(.cereal(32, weight: .bold))
                    .multilineTextAlignment(.center)

                Text(subtitle)
                    .scaledFont(.cereal(16, weight: .medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            
//            Custom Buttons
            CustomButton(
                                     title: AppConstants.Buttons.getStarted,
                                     backgroundColor: .primary,
                                     foregroundColor: .white
                                 ) {
                                     withAnimation {
                                         if(selectedTab == 2){
                                             isOnboardingComplete = true
                                             print("🎉 Onboarding Complete Triggered")
                                         }else{
                                             selectedTab += 1
                                             print("👉 Selected Tab: \(selectedTab)")
                                         }
                                     }
                                 }
           
        } .offset(y: -40)
           .padding(.horizontal, 20)
           .padding(.vertical,10)
        
        

    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
} 
