import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5

    var body: some View {
        NavigationStack {
            ZStack {
                // Background image
                Image("bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .clipped()
                    .ignoresSafeArea()

                // Overlay layer
                Color.black.opacity(0.1)
                    .ignoresSafeArea()

                // Animated logo/title
                VStack {
                    Text(AppConstants.Titles.appName)
                        .scaledFont(.cereal(36, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 28)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.3)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    isActive = true
                }
            }
            .navigationDestination(isPresented: $isActive) {
                OnboardingView()
            }
        }
    }
}
