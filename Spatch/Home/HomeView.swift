import SwiftUI

// MARK: - HomeView (앱 첫 화면)
struct HomeView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    // 헤더
                    HomeHeroHeaderView()
                    
                    //추천 여행코스 SWift 파일 분리 
                    RecommendedCourseSection()
                    .padding(.top,0)
                    
                    
                    QuestSectionView()
                        .padding(.top,42)
                        .padding(.horizontal, 20)
                    
                    AddBanner()
                        .padding(.top,0)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Word()
                            .padding(.top, 31) // Word와 화면 상단 간격

                        Spacer().frame(height: 1)

                        ExplorerRecordSection()
                    }


                    .padding(.top, 16)
                    .padding(.horizontal, 20)

                    Spacer(minLength: 24)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}



////////////////////////////////////////////////////////////////
// MARK: - HomeHeroHeaderView
////////////////////////////////////////////////////////////////

struct HomeHeroHeaderView: View {

    var body: some View {
        ZStack(alignment: .topLeading) {

            // 배경
            Color.black

            // 별/점 레이어
            starsLayer

            // 상단 바
            topBar
                .padding(.top, 18)
                .padding(.horizontal, 18)

            // 메인 콘텐츠
            heroContent
        }
        .frame(width: 390, height: 278)
        .clipped()
    }
}

// MARK: - Top Bar
private extension HomeHeroHeaderView {
    var topBar: some View {
        HStack {
            Text("SPOT!CH")
                .font(.paperlogy(.black, size: 20))
                .foregroundColor(.white)

            Spacer()

            HStack(spacing: 14) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 18))
                    .foregroundColor(.white)

                Image(systemName: "bell")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
            }
        }
        .frame(height: 44)
    }
}

// MARK: - Hero Content
private extension HomeHeroHeaderView {
    var heroContent: some View {
        ZStack(alignment: .topLeading) {

            VStack(alignment: .leading, spacing: 10) {
                Spacer().frame(height: 88)

                Text("기억은 흐릿해도,\n기록은 선명하니까요.")
                    .font(.paperlogy(.medium, size: 26))
                    .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95))

                HStack(spacing: 6) {
                    Text("나만의 탐사일정을 시작해보세요")
                        .font(.pretendard(.regular, size: 14))
                        .foregroundColor(.white.opacity(0.8))

                    Image(systemName: "chevron.right")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white.opacity(0.8))
                }

                Spacer()
            }
            .padding(.leading, 18)

            // 캐릭터
            Image("KakaoTalk-20250819-141100817-unscreen 2")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .offset(x: 236, y: 92)

            // 언덕 그라데이션 벡터
            Image("Vector 4156")
                .resizable()
                .scaledToFit()
                .frame(width: 205, height: 67)
                .offset(x: 185, y: 175)
        }
    }
}

// MARK: - Stars Layer
private extension HomeHeroHeaderView {
    var starsLayer: some View {
        ZStack {
            Image("Ellipse 630")
                .resizable()
                .frame(width: 7, height: 7)
                .blur(radius: 3.15)
                .offset(x: 130, y: 92)

            Image("Ellipse 634")
                .resizable()
                .frame(width: 10, height: 10)
                .blur(radius: 3.15)
                .offset(x: 260, y: 78)

            Image("Ellipse 633")
                .resizable()
                .frame(width: 3, height: 3)
                .offset(x: 210, y: 58)

            Image("Ellipse 639")
                .resizable()
                .frame(width: 4, height: 4)
                .offset(x: 92, y: 66)

            Image("Ellipse 641")
                .resizable()
                .frame(width: 3, height: 3)
                .offset(x: 312, y: 120)

            Image("Ellipse 640")
                .resizable()
                .frame(width: 5, height: 5)
                .blur(radius: 3.15)
                .offset(x: 62, y: 148)

            Image("Ellipse 636")
                .resizable()
                .frame(width: 7, height: 7)
                .blur(radius: 3.15)
                .offset(x: 340, y: 54)

            Image("Ellipse 637")
                .resizable()
                .frame(width: 3, height: 3)
                .offset(x: 290, y: 40)

            Image("Group 1707483160")
                .resizable()
                .frame(width: 6, height: 6)
                .offset(x: 170, y: 40)
        }
    }
}

