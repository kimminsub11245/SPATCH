import SwiftUI

enum TabItem: String, CaseIterable {
    case home, schedule, log, community, mypage

    var title: String {
        switch self {
        case .home: return "홈"
        case .schedule: return "일정"
        case .log: return "탐사일지"
        case .community: return "커뮤니티"
        case .mypage: return "내정보"
        }
    }

    var iconName: String {
        switch self {
        case .home: return "Home"
        case .schedule: return "Schedule"
        case .log: return "Log"
        case .community: return "community"
        case .mypage: return "Mypage"
        }
    }
}

struct CustomTabBarView: View {
    // 홈 고정 표시용 (다른 탭 못 가게 할 거면 @State 필요 없음)
    private let selectedTab: TabItem = .home

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            // ✅ 항상 HomeView만 표시
            HomeView()
            
            // MARK: - Custom Tab Bar
            ZStack {
                Image("Rectangle 74")
                    .resizable()
                    .frame(width: 390, height: 95)
                    .background(Color(red: 0.08, green: 0.08, blue: 0.08))
                    .shadow(color: .black.opacity(0.14), radius: 12, x: 0, y: -2)
                
                HStack(alignment: .center, spacing: 21) {
                    ForEach(TabItem.allCases, id: \.self) { tab in
                        Button(action: {
                            // Do nothing. 홈 고정이므로 선택 불가
                        }) {
                            VStack(alignment: .center, spacing: 4) {
                                Image(selectedTab == tab ? "\(tab.iconName)_Join" : tab.iconName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: iconSize(for: tab).width, height: iconSize(for: tab).height)

                                Text(tab.title)
                                    .font(Font.custom("Pretendard", size: 12))
                                    .foregroundColor(selectedTab == tab ? .white : Color(red: 0.27, green: 0.27, blue: 0.27))
                                    .frame(maxWidth: .infinity, alignment: .top)
                            }
                            .frame(width: 52, alignment: .top)
                        }
                    }
                }
                .padding(.bottom, 12)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }

    func iconSize(for tab: TabItem) -> CGSize {
        switch tab {
        case .home: return CGSize(width: 22, height: 22)
        case .schedule: return CGSize(width: 19.09, height: 21)
        case .log: return CGSize(width: 20, height: 20)
        case .community: return CGSize(width: 23.33, height: 21)
        case .mypage: return CGSize(width: 18, height: 19.69)
        }
    }
}
