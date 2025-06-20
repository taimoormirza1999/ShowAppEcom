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
        if isOnboardingComplete {
            SignInView()
        } else {
            ZStack {
                TabView(selection: $selectedTab) {
                    OnboardingPage(
                        title: AppConstants.Onboarding.title1,
                        subtitle: AppConstants.Onboarding.subtitle1,
                        imageName: "shoe1"
                    )
                    .tag(0)
                    
                    OnboardingPage(
                        title: AppConstants.Onboarding.title2,
                        subtitle: AppConstants.Onboarding.subtitle2,
                        imageName: "shoe2"
                    )
                    .tag(1)
                    
                    OnboardingPage(
                        title: AppConstants.Onboarding.title3,
                        subtitle: AppConstants.Onboarding.subtitle3,
                        imageName: "shoe3"
                    )
                    .tag(2)
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                VStack {
                    Spacer()
                    if selectedTab == 2 {
                        CustomButton(
                            title: AppConstants.Buttons.getStarted,
                            backgroundColor: .primary,
                            foregroundColor: .white
                        ) {
                            withAnimation {
                                isOnboardingComplete = true
                            }
                        }
                    } else {
                        CustomButton(
                            title: AppConstants.Buttons.next,
                            backgroundColor:.primary,
                            foregroundColor: .white
                        ) {
                            withAnimation {
                                selectedTab += 1
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
    }
}

struct OnboardingPage: View {
    let title: String
    let subtitle: String
    let imageName: String
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                Image("nike")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                    .opacity(0.05) // like a faded watermark
                    .offset(y: -40) // optional positioning
                
                // 2. Circle blur or dot
                Image("circles")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .opacity(0.2)
                    .offset(x: -80, y: 100) // optional
                
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    .padding(.top, 60)
            }
            VStack(spacing: 12) {
                Text(title)
                    .scaledFont(.cereal(32, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Text(subtitle)
                    .scaledFont(.cereal(16, weight: .medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
} 
