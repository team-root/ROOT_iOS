
import SwiftUI

extension Text {
    func ROOTStyle(_ style: ROOTFontStyle) -> Text {
        let fontData = style.fontData()
        return self
            .font(.custom(fontData.fontName, size: fontData.size))
    }
}

extension ROOTFontStyle {
    func fontData() -> (fontName: String, size: CGFloat) {
        switch self {
        case .heading1:
            return ("Pretendard-Bold", 40)
        case .heading2:
            return ("Pretendard-Bold", 36)
        case .heading3:
            return ("Pretendard-Bold", 32)
        case .heading4:
            return ("Pretendard-Medium", 28)
        case .heading5:
            return ("Pretendard-Medium", 24)
        case .heading6:
            return ("Pretendard-Medium", 20)
        case .body1, .body2:
            return ("Pretendard-Regular", 16)
        case .body3, .body4:
            return ("Pretendard-Regular", 14)
        case .caption1, .caption2:
            return ("Pretendard-Regular", 12)
        case .caption3, .caption4:
            return ("Pretendard-Regular", 10)
        }
    }
}
