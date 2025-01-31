import SwiftUI

public struct ROOTFont: ViewModifier {
    public var style: ROOTFontStyle

    public func body(content: Content) -> some View {
        print("Applying font: \(style)")
        switch style {
        case let .heading(font):
            return content
                .font(.custom("Pretendard-\(font.weight.rawValue)", size: font.size))

        case let .body(font):
            return content
                .font(.custom("Pretendard-\(font.weight.rawValue)", size: font.size))

        case let .caption(font):
            return content
                .font(.custom("Pretendard-\(font.weight.rawValue)", size: font.size))
        }
    }
}

public extension View {
    func rootFont(_ style: ROOTFontStyle) -> some View {
        self
            .modifier(ROOTFont(style: style))
    }

    func rootFont(_ style: ROOTFontStyle, color: Color) -> some View {
        self
            .rootFont(style)
            .foregroundColor(color)
    }
}
