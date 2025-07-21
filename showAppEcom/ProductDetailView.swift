import SwiftUI

struct ProductDetailView: View {
    let productName = "Nike Air Jordan"
    let productID: String
    let price = "$849.69"
    let description = "Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike...."

    @State private var selectedSize: Int = 40
    @State private var showAlert = false
    @State private var navigateToHome = false
    @State private var navigateToCart = false

    var body: some View {
        NavigationStack {
        ZStack {
            Color(.systemGray6).ignoresSafeArea()

            VStack(spacing: 0) {
                // Product Image with Header
                ZStack(alignment: .top) {
                    Image("shoe1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 280)
                        .padding(.top, 20)

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

                        Button(action: {
                            print("🪵 Cart Button Tapped")
                            navigateToCart = true
                        }) {
                            Image( "cart")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.045)
                    .padding(.top, 5)
                }

                // Scrollable Content
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Title & Description
                        VStack(alignment: .leading, spacing: 6) {
                            Text("BEST SELLER")
                                .font(.caption)
                                .foregroundColor(.blue)

                            Text(productName)
                                .font(.title2.bold())

                            Text("$967.800")
                                .font(.title3.bold())

                            Text(description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }

                        // Gallery
                        VStack(alignment: .leading) {
                            Text("Gallery")
                                .font(.headline)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    ForEach(["shoe1", "shoe2", "shoe3", "shoe4"], id: \.self) { image in
                                        Image(image)
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .shadow(radius: 2)
                                    }
                                }
                            }
                        }

                        // Size Selector
                        VStack(alignment: .leading) {
                            Text("Size")
                                .font(.headline)

                            HStack(spacing: 12) {
                                ForEach(38...43, id: \.self) { size in
                                    Text("\(size)")
                                        .font(.system(size: 14, weight: .medium))
                                        .frame(width: 40, height: 40)
                                        .background(selectedSize == size ? Color.blue : Color.white)
                                        .foregroundColor(selectedSize == size ? .white : .black)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.gray.opacity(0.2), lineWidth: 1))
                                        .shadow(radius: selectedSize == size ? 4 : 0)
                                        .onTapGesture {
                                            selectedSize = size
                                        }
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(.top, -20)
                }

                // Bottom Bar
                HStack {
                    VStack(alignment: .leading) {
                        Text("Price")
                            .font(.caption)
                            .foregroundColor(.gray)

                        Text(price)
                            .font(.title3.bold())
                    }

                    Spacer()

                    Button(action: {
                        showAlert = true
                    }) {
                        Text("Add To Cart")
                            .foregroundColor(.white)
                            .frame(width: 160, height: 50)
                            .background(Color.blue)
                            .clipShape(Capsule())
                    }
                }
                .padding()
                .background(Color.white.shadow(radius: 5))
            }
            .onAppear {
            print("🪵 Navigated with Product ID: \(productID)")
        }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("✅ Added to Cart"),
                message: Text("Your product has been added to the cart."),
                dismissButton: .default(Text("OK"))
            )
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $navigateToHome) {
            HomeView()
        }
        .navigationDestination(isPresented: $navigateToCart) {
            CartView()
        }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(productID: "12345")
    }
}
