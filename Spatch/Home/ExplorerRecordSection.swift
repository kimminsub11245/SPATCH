import SwiftUI

struct ExplorerRecordSection: View {
    // 실제 사용할 이미지 이름 배열 (Assets에 있는 이미지 이름으로 바꿔줘)
    let largeImages = ["Rectangle 3465220", "Rectangle 3465225", "Rectangle 3465226", "Rectangle 3465227", "Rectangle 3465228"]
    let tlImages = ["Rectangle 3465222", "TL_1", "TL_2", "TL_3", "TL_4"]
    let trImages = ["Rectangle 3465223", "TR_1", "TR_2", "TR_3", "TR_4"]
    let blImages = ["Rectangle 3465218", "BL_1", "BL_2", "BL_3", "BL_4"]
    let brImages = ["Rectangle 3465224", "BR_1", "BR_2", "BR_3", "BR_4"]
    let avatarImages = ["Ellipse 627", "Avatar 1", "Avatar 2", "Avatar 3", "Avatar 4"]
    let titles = ["제주도 Girl’s Day", "경주 골목 여행", "여름 무계획 대전여행", "ENFJ들의 서귀포 3박4일", "방콕 힐링여행"]

    var body: some View {
        
        
        
        VStack(alignment: .leading, spacing: 32) {
            ForEach(0..<5, id: \.self) { index in
                VStack(alignment: .leading, spacing: 16) {
                    // MARK: - Image Grid
                    HStack(spacing: 8) {
                        Image(largeImages[index])
                            .resizable()
                            .frame(width: 160, height: 213)
                            .cornerRadius(6)
                            .clipped()
                        
                        VStack(spacing: 8) {
                            HStack(spacing: 8) {
                                Image(tlImages[index])
                                    .resizable()
                                    .frame(width: 88, height: 117)
                                    .background(Color(red: 0.16, green: 0.16, blue: 0.17))
                                    .cornerRadius(6)
                                    .offset(y: 14)
                                
                                Image(trImages[index])
                                    .resizable()
                                    .frame(width: 88, height: 88)
                                    .background(Color(red: 0.16, green: 0.16, blue: 0.17))
                                    .cornerRadius(6)
                            }
                            
                            HStack(spacing: 8) {
                                Image(blImages[index])
                                    .resizable()
                                    .frame(width: 88, height: 88)
                                    .background(Color(red: 0.16, green: 0.16, blue: 0.17))
                                    .cornerRadius(6)
                                
                                ZStack {
                                    Image(brImages[index])
                                        .resizable()
                                        .frame(width: 88, height: 117)
                                        .background(Color(red: 0.16, green: 0.16, blue: 0.17))
                                        .cornerRadius(6)
                                        .overlay(Color.black.opacity(0.6))
                                        .offset(y: -6)
                                    
                                    Text("+\(index + 2)")
                                        .font(.pretendard(.medium, size: 20))
                                        .foregroundColor(.white)
                                        .offset(y: -6)
                                }
                            }
                        }
                    }
                    .frame(width: 354)
                    
                    // MARK: - Location Info
                    HStack(spacing: 8) {
                        Image(avatarImages[index])
                            .resizable()
                            .frame(width: 38, height: 38)
                            .cornerRadius(19)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(titles[index])
                                .font(.paperlogy(.regular, size: 16))
                                .foregroundColor(.white)
                            
                            HStack(spacing: 3) {
                                Image("Vector")
                                    .resizable()
                                    .frame(width: 8, height: 10)
                                
                                Text("위치 텍스트")
                                    .font(.pretendard(.light, size: 12))
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 12) {
                            HStack(spacing: 4) {
                                Image("Vector-1")
                                    .resizable()
                                    .frame(width: 13, height: 12)
                                Text("\(1_000 + index * 345)")
                                    .font(.pretendard(.regular, size: 12))
                                    .foregroundColor(Color.gray)
                            }
                            
                            HStack(spacing: 4) {
                                Image("Vector-2")
                                    .resizable()
                                    .frame(width: 12, height: 14)
                                Text("\(100 + index * 23)")
                                    .font(.pretendard(.regular, size: 12))
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                    .frame(width: 354)
                }
            }
        }
    }
}

#Preview {
    ExplorerRecordSection()
        .background(Color.black)
}
