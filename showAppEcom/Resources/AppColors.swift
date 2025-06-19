import SwiftUI

extension Color {
    static let lightPrimary = Color(hex: "#5B9EE1")
    static let lightSubText = Color(hex: "#707B81")
    static let lightFrameColor = Color(hex: "F8F9FA")
}
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64

        switch hex.count {
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, (int >> 16) & 0xff, (int >> 8) & 0xff, int & 0xff)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = ((int >> 24) & 0xff, (int >> 16) & 0xff, (int >> 8) & 0xff, int & 0xff)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension LinearGradient {
    static let pastelGradient = LinearGradient(
        gradient: Gradient(stops: [
            .init(color: Color(red: 203/255, green: 255/255, blue: 155/255).opacity(0.2), location: 0.0),
            .init(color: Color(red: 255/255, green: 155/255, blue: 203/255).opacity(0.2), location: 0.5433),
            .init(color: Color(red: 255/255, green: 181/255, blue: 141/255).opacity(0.2), location: 1.0)
        ]),
        startPoint: .leading,
        endPoint: .trailing // 90deg in CSS = left-to-right in SwiftUI
    )
}
