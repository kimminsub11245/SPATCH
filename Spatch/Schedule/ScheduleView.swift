import SwiftUI

struct ScheduleView: View {
    var body: some View {
        ZStack(alignment: .top) { // 👈 ZStack 상단 정렬
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                // MARK: - 나의 일정 헤더
                HStack(alignment: .center) {
                    Text("나의 일정")
                        .font(.pretendard(.semiBold, size: 18))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image("SVector")
                        .resizable()
                        .frame(width: 18, height: 18)
                    
                    Image("SVector3")
                        .resizable()
                        .frame(width: 44, height: 44)
                        
                }
                .padding(.horizontal, 0)
                .padding(.vertical, 10)
                .padding(.top, 50)

                
                // MARK: - 캐릭터 안내
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("9번의 여행 완료! \n다음 스팟은?")
                            .font(.paperlogy(.medium, size: 26))
                            .foregroundColor(.white)
                            .frame(width: 174, height: 72, alignment: .leading)
                            .minimumScaleFactor(0.7)
                            .truncationMode(.tail)
                        
                        HStack(alignment: .center, spacing: 5) {
                            Text("여행 코스 추천 받기")
                                .font(.pretendard(.semiBold, size: 14))
                                .foregroundColor(.white)
                                .frame(width: 100, height: 20, alignment: .leading)
                                .lineLimit(1)
                                .minimumScaleFactor(0.7)
                                .truncationMode(.tail)
                            
                            Image("SVector4")
                                .resizable()
                                .frame(width: 4, height: 8)
                                
                        }
                        .padding(0)
                    }
                    
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 167, height: 167)
                        .background(
                            Image("image 1086")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 167, height: 167)
                                .clipped()
                        )
                }
                .padding(.top, 10)
                .padding(.bottom, 42)
                
                // MARK: - 예정된 탐사
                Text("예정된 탐사")
                    .font(.pretendard(.bold, size: 20))
                    .foregroundColor(.white)
                    .frame(width: 354, height: 28, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 16) {
                    HStack(alignment: .center, spacing: 10) {
                        VStack(alignment: .center, spacing: 6) {
                            Text("예정된 일정이 없습니다")
                                .font(.pretendard(.semiBold, size: 16))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .lineLimit(1)
                                .minimumScaleFactor(0.7)
                                .truncationMode(.tail)
                            
                            HStack(alignment: .center, spacing: 6) {
                                Text("일정을 추가하러 가볼까요?")
                                    .font(.pretendard(.regular, size: 12))
                                    .foregroundColor(Color.white.opacity(0.76))
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.7)
                                    .truncationMode(.tail)
                                
                                Image("SVector4")
                                    .resizable()
                                    .frame(width: 4, height: 8)
                                    
                                    
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal, 112)
                    .padding(.vertical, 22)
                    .background(Color(red: 0.12, green: 0.13, blue: 0.14))
                    .cornerRadius(12)
                }
                .padding(.top, 12)
                .frame(width: 354, alignment: .leading)
                
                // MARK: - 지난 탐사
                Text("지난 탐사")
                    .font(.pretendard(.bold, size: 20))
                    .foregroundColor(.white)
                    .frame(width: 354, height: 28, alignment: .leading)
                    .padding(.top, 42)
                
                VStack(alignment: .leading, spacing: 16) {
                    HStack(alignment: .center, spacing: 10) {
                        Text("지난 일정이 없습니다")
                            .font(.pretendard(.semiBold, size: 16))
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95))
                            .lineLimit(1)
                            .minimumScaleFactor(0.7)
                            .truncationMode(.tail)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 22)
                    .frame(maxWidth: .infinity, minHeight: 89, maxHeight: 89)
                    .background(Color(red: 0.12, green: 0.13, blue: 0.14))
                    .cornerRadius(12)
                }
                .padding(.top, 12)
                .frame(width: 354, alignment: .leading)
            }
            .padding(.horizontal, 18)
            .frame(maxHeight: .infinity, alignment: .top) // 👈 VStack 높이 무한 + top 정렬
        }
        .frame(width: 390, height: 844)
    }
}

#Preview {
    ScheduleView()
}
