import SwiftUI

extension Font {
    static func cereal(_ size: CGFloat, weight: Weight = .regular) -> Font {
        switch weight {
        case .light:
            return .custom("AirbnbCerealWLt", size: size)
        case .medium:
            return .custom("AirbnbCerealWMd", size: size)
        case .bold:
            return .custom("AirbnbCerealWBd", size: size)
        case .black:
            return .custom("AirbnbCerealWBlk", size: size)
        case .heavy:
            return .custom("AirbnbCerealWXBd", size: size)
        case .regular:
            fallthrough
        default:
            return .custom("AirbnbCerealWBk", size: size)
        }
    }
}


extension Font {
    static var titleCereal: Font {
        .cereal(24, weight: .bold)
    }

    static var bodyCereal: Font {
        .cereal(16, weight: .regular)
    }

    static var captionCereal: Font {
        .cereal(12, weight: .light)
    }
}


extension View {
    func scaledFont(_ font: Font) -> some View {
        self.modifier(ScaledFont(font: font))
    }
}

struct ScaledFont: ViewModifier {
    let font: Font

    @Environment(\.sizeCategory) var sizeCategory

    func body(content: Content) -> some View {
        content.font(font) // This enables scaling
    }
}
