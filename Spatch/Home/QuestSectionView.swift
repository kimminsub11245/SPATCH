import SwiftUI

// MARK: - QuestSectionView
struct QuestSectionView: View {

    struct QuestCard: Identifiable {
        let id = UUID()
        let imageAssetName: String
        let title: String
        let subtitle: String
    }

    // ✅ 더미 데이터
    private let cards: [QuestCard] = [
        .init(imageAssetName: "Component 285", title: "지금 먹고 있는 음식,", subtitle: "광각샷으로 남겨봐!"),
        .init(imageAssetName: "Component 285", title: "지금 보고 있는 풍경,", subtitle: "하늘까지 담아봐!"),
        .init(imageAssetName: "Component 285", title: "지금 타고 있는 이동수단,", subtitle: "느낌 있게 남겨봐!")
    ]

    @State private var page: Int = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            // 타이틀 + 자세히보기
            HStack(alignment: .center) {
                Text("퀘스트는 어떻게 진행될까요?")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95))

                Spacer()

                HStack(spacing: 6) {
                    Text("자세히 보기")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95).opacity(0.7))

                    Image("Group 44")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10, height: 10)
                }
            }
            .frame(width: 354, alignment: .center)

            // ✅ 카드: 옆에 다음 카드가 98px 정도 보이게 (iOS 17+)
            if #available(iOS 17.0, *) {
                QuestPagingRow(cards: cards, page: $page)
                    .frame(height: 350) // 카드 높이
            } else {
                // iOS 16 이하 fallback (옆 미리보기 X)
                TabView(selection: $page) {
                    ForEach(Array(cards.enumerated()), id: \.offset) { idx, item in
                        QuestCardView(
                            imageAssetName: item.imageAssetName,
                            title: item.title,
                            subtitle: item.subtitle
                        )
                        .tag(idx)
                    }
                }
                .frame(width: 262, height: 350)
                .tabViewStyle(.page(indexDisplayMode: .never))
            }

            // ✅ 도트(가운데 정렬 + 4개 고정)
            HStack(spacing: 6) {
                ForEach(0..<4, id: \.self) { i in
                    Dot(isActive: i == (page % 4))
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 6)
        }
    }
}

// MARK: - iOS17+ Paging Row (옆 카드 살짝 보이기)
@available(iOS 17.0, *)
private struct QuestPagingRow: View {
    let cards: [QuestSectionView.QuestCard]
    @Binding var page: Int

    @State private var scrollID: Int? = 0
    @State private var currentIndex: Int = 0

    private let leading: CGFloat = 20
    private let spacing: CGFloat = 10

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal) {
                LazyHStack(spacing: spacing) {
                    ForEach(Array(cards.enumerated()), id: \.offset) { idx, item in
                        QuestCardView(
                            imageAssetName: item.imageAssetName,
                            title: item.title,
                            subtitle: item.subtitle
                        )
                        .id(idx)
                        .scrollTargetLayout()
                        .background(
                            GeometryReader { geo in
                                Color.clear.preference(
                                    key: CardXPreferenceKey.self,
                                    value: [idx: geo.frame(in: .named("QuestScroll")).minX]
                                )
                            }
                        )
                    }
                }
                .padding(.leading, leading)
                .padding(.trailing, leading)
            }
            .coordinateSpace(name: "QuestScroll")
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $scrollID)

            // ✅ 드래그 중에도 “가까운 카드” 기준으로 도트 즉시 변경
            .onPreferenceChange(CardXPreferenceKey.self) { xs in
                let targetX = leading
                if let nearest = xs.min(by: { abs($0.value - targetX) < abs($1.value - targetX) })?.key {
                    if currentIndex != nearest {
                        currentIndex = nearest
                        page = nearest
                    }
                }
            }

            // ✅ 손 떼면 가장 가까운 카드로 딱 스냅
            .onScrollPhaseChange { _, newPhase in
                if newPhase == .idle {
                    scrollID = currentIndex
                    withAnimation(.easeOut(duration: 0.18)) {
                        proxy.scrollTo(currentIndex, anchor: .leading)
                    }
                }
            }

            .onAppear {
                currentIndex = page
                scrollID = page
                DispatchQueue.main.async {
                    proxy.scrollTo(page, anchor: .leading)
                }
            }
        }
    }
}

private struct CardXPreferenceKey: PreferenceKey {
    static var defaultValue: [Int: CGFloat] = [:]
    static func reduce(value: inout [Int: CGFloat], nextValue: () -> [Int: CGFloat]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}

// MARK: - Quest Card (262 x 350 고정)
private struct QuestCardView: View {
    let imageAssetName: String
    let title: String
    let subtitle: String

    var body: some View {
        ZStack(alignment: .bottomLeading) {

            // 배경 이미지
            Image(imageAssetName)
                .resizable()
                .scaledToFill()
                .frame(width: 262, height: 350)
                .clipped()

            

            // 텍스트 영역(185 x 94)
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)

                Text(subtitle)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
            }
            .frame(width: 185, height: 94, alignment: .topLeading)
            .padding(.leading, 18)
            .padding(.bottom, 18)
        }
        .frame(width: 262, height: 350)
        .fixedSize()
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .stroke(Color(red: 0.95, green: 0.95, blue: 0.95).opacity(0.3), lineWidth: 1)
        )
    }
}

// MARK: - Dot (6x6)
private struct Dot: View {
    let isActive: Bool

    var body: some View {
        if isActive {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color(red: 0.4, green: 0.42, blue: 1))
                .frame(width: 6, height: 6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color(red: 0.4, green: 0.42, blue: 1), lineWidth: 0.4)
                )
        } else {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color(red: 0.62, green: 0.62, blue: 0.62))
                .frame(width: 6, height: 6)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        QuestSectionView()
            .padding(.horizontal, 20)
    }
}
