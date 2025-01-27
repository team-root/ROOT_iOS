import SwiftUI

protocol ROOTFontable {
    var size: CGFloat { get }
    var weight: ROOTFontWeight { get }
}

public enum ROOTFontWeight: String {
    case bold = "Bold"
    case semibold = "SemiBold"
    case regular = "Regular"
}

public enum ROOTFontStyle: Hashable {
    case heading(ROOTFontStyle.Heading)
    case body(ROOTFontStyle.Body)
    case caption(ROOTFontStyle.Caption)

    public enum Heading: CGFloat, ROOTFontable {
        case heading1 = 40
        case heading2 = 36
        case heading3 = 32
        case heading4 = 28
        case heading5 = 24
        case heading6 = 20
    }

    public enum Body: CGFloat, ROOTFontable {
        case body1, body2 = 16
        case body3, body4 = 14
    }

    public enum Caption: CGFloat, ROOTFontable {
        case caption1, caption2 = 12
        case caption3, caption4 = 10
    }
}

// MARK: - FontableSize
extension ROOTFontable where Self: RawRepresentable, Self.RawValue == CGFloat {
    var size: CGFloat {
        self.rawValue
    }
}

// MARK: - Headline
public extension ROOTFontStyle.Heading {
    var weight: ROOTFontWeight {
        switch self {
        case .heading1, .heading2, .heading3:
            return .bold
        case .heading4, .heading5, .heading6:
            return .semibold
        }
    }
}

// MARK: - Text
public extension ROOTFontStyle.Body {
    var weight: ROOTFontWeight {
        switch self {
        case .body1, .body3:
            return .semibold
        case .body2, .body4:
            return .regular
        }
    }
}

// MARK: - Button
public extension ROOTFontStyle.Caption {
    var weight: ROOTFontWeight {
        switch self {
        case .caption1, .caption3:
            return .semibold
        case .caption2, .caption4:
            return .regular
        }
    }
}
