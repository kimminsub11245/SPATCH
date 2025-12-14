import SwiftUI

// MARK: - App Fonts
enum AppFont {
    enum Paperlogy: String {
        case thin = "Paperlogy-1Thin"
        case extraLight = "Paperlogy-2ExtraLight"
        case light = "Paperlogy-3Light"
        case regular = "Paperlogy-4Regular"
        case medium = "Paperlogy-5Medium"
        case semiBold = "Paperlogy-6SemiBold"
        case bold = "Paperlogy-7Bold"
        case extraBold = "Paperlogy-8ExtraBold"
        case black = "Paperlogy-9Black"
    }

    enum Pretendard: String {
        // ✅ 네가 실제로 쓰는 이름으로 맞춰 (Pretendard-Regular / Pretendard 등)
        case regular = "Pretendard-Regular"
        case medium = "Pretendard-Medium"
        case semiBold = "Pretendard-SemiBold"
        case bold = "Pretendard-Bold"
    }
}

extension Font {
    static func paperlogy(_ w: AppFont.Paperlogy, size: CGFloat) -> Font {
        .custom(w.rawValue, size: size)
    }

    static func pretendard(_ w: AppFont.Pretendard, size: CGFloat) -> Font {
        .custom(w.rawValue, size: size)
    }
}
