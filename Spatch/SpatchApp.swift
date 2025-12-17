import SwiftUI

@main
struct SpatchApp: App {

    init() {
        applyGlobalFont()
    }

    var body: some Scene {
        WindowGroup {
            ScheduleView()
                .environment(\.font, .custom("Pretendard-Regular", size: 16))
        }
    }

    private func applyGlobalFont() {
        UILabel.appearance().font = UIFont(name: "Pretendard-Regular", size: 16)
        UITextView.appearance().font = UIFont(name: "Pretendard-Regular", size: 16)
    }
}
