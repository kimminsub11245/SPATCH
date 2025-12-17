import SwiftUI

struct RecommendedCourseSection: View {

    struct Course: Identifiable {
        let id = UUID()
        let title: String
        let assetName: String
    }

    private let courses: [Course] = [
        .init(title: "가족코스", assetName: "family"),
        .init(title: "혼자코스", assetName: "solo"),
        .init(title: "힐링코스", assetName: "healing"),
        .init(title: "도보코스", assetName: "road"),
        .init(title: "캠핑코스", assetName: "camping")
    ]

    @State private var selectedIndex: Int = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {

            Text("추천 여행코스")
                .font(.custom("Pretendard", size: 18).weight(.semibold))
                .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95))
                .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    ForEach(Array(courses.enumerated()), id: \.offset) { idx, item in
                        CourseCard(
                            title: item.title,
                            assetName: item.assetName,
                            isSelected: idx == selectedIndex
                        )
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.15)) {
                                selectedIndex = idx
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 4)
            }
        }
    }
}

// MARK: - Card
private struct CourseCard: View {
    let title: String
    let assetName: String
    let isSelected: Bool

    var body: some View {
        VStack(spacing: 6) {

            Spacer(minLength: 0)

            // 아이콘
            Image(assetName)
                .resizable()
                .scaledToFit()
                .frame(width: 42, height: 42)

            // 텍스트
            Text(title)
                .font(.custom("Pretendard", size: 14).weight(.medium))
                .foregroundColor(.white)

            Spacer(minLength: 0)
        }
        .frame(width: 76, height: 99) // ✅ Figma 사이즈 고정
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color(red: 0.10, green: 0.11, blue: 0.12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(
                            isSelected
                            ? Color(red: 0.66, green: 0.73, blue: 0.96)
                            : Color.white.opacity(0.10),
                            lineWidth: 1
                        )
                )
        )
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        RecommendedCourseSection()
    }
}
