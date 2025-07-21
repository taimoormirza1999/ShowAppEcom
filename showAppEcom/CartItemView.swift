import SwiftUI

struct CartItemView: View {
    let imageName: String
    let title: String
    let price: String
    let size: String
    @Binding var quantity: Int
    var onDelete: () -> Void

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            // 🖼️ Product Image
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .background(Color.lightFrameColor)
                .cornerRadius(20)

            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .scaledFont(.cereal(16, weight: .bold))
                Text(price)
                    .scaledFont(.cereal(14, weight: .medium))
                    .foregroundColor(.lightSubText)

                HStack(spacing: 12) {
                    Button(action: {
                        if quantity > 1 { quantity -= 1 }
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(.black)
                            .frame(width: 28, height: 28)
                            .background(Color.white)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray.opacity(0.2)))
                    }

                    Text("\(quantity)")
                        .scaledFont(.cereal(14))

                    Button(action: {
                        quantity += 1
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .frame(width: 28, height: 28)
                            .background(Color.lightPrimary)
                            .clipShape(Circle())
                    }
                }
            }
            Spacer()

            VStack(alignment: .center, spacing: 6) {
                Text(size)
                    .scaledFont(.cereal(14, weight: .medium))
                    .foregroundColor(.lightSubText)

                Button(action: {
                    print("🪵 Delete Button Tapped")
                    onDelete()
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(
            imageName: "product1",
            title: "Product 1",
            price: "$100",
            size: "M",
            quantity: .constant(1),
            onDelete: {}
        )
    }
}