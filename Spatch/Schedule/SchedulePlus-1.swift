import SwiftUI

struct SchedulPlus1: View {
    @State private var showBorder1 = false
    @State private var showBorder2 = false
    @State private var highlightPrev = false
    @State private var highlightNext = false
    @State private var goNext = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack(spacing: 0) {

                    // MARK: - 상단바
                    Spacer().frame(height: 50)

                    ZStack {
                        Text("일정 등록")
                            .font(.pretendard(.semiBold, size: 18))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)

                        HStack {
                            Image("SBack")
                                .resizable()
                                .frame(width: 7.5, height: 15)
                                .padding(.leading, 21.25)
                            Spacer()
                        }
                    }
                    .frame(height: 50)

                    // MARK: - 타이틀
                    Spacer().frame(height: 24)

                    Text("탐사 일정을 선택해주세요.")
                        .font(.pretendard(.regular, size: 14))
                        .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95).opacity(0.76))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 18)

                    Spacer().frame(height: 6)

                    Text("이번에는 어떤\n계획을 만드실 건가요?")
                        .font(.paperlogy(.medium, size: 26))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 18)

                    // MARK: - 첫 번째 카드
                    Spacer().frame(height: 32)

                    ZStack(alignment: .topLeading) {
                        Image("Maskgroup")
                            .resizable()
                            .frame(width: 354, height: 137)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.white.opacity(showBorder1 ? 1 : 0), lineWidth: 2)
                                    .animation(.easeInOut(duration: 0.2), value: showBorder1)
                            )
                            .onTapGesture {
                                showBorder1 = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    showBorder1 = false
                                    goNext = true
                                }
                            }

                        Image("Plan1char")
                            .resizable()
                            .frame(width: 152.78957, height: 152.78957)
                            .offset(x: 8.25, y: -18)

                        Text("나에게 꼭 맞는\n여행 일정 추천받기")
                            .font(.paperlogy(.medium, size: 16))
                            .foregroundColor(.white)
                            .frame(width: 120)
                            .offset(x: 200, y: 78)

                        Image("SPBack")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .offset(x: 320, y: 99)
                    }
                    .frame(width: 354, height: 137)
                    .padding(.horizontal, 18)

                    // MARK: - 두 번째 카드
                    Spacer().frame(height: 14)

                    ZStack(alignment: .topLeading) {
                        Image("Maskgroup")
                            .resizable()
                            .frame(width: 354, height: 137)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.white.opacity(showBorder2 ? 1 : 0), lineWidth: 2)
                                    .animation(.easeInOut(duration: 0.2), value: showBorder2)
                            )
                            .onTapGesture {
                                showBorder2 = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    showBorder2 = false
                                    goNext = true
                                }
                            }

                        Text("나만의 방식으로\n직접 계획 짜고싶어요")
                            .font(.paperlogy(.medium, size: 16))
                            .foregroundColor(.white)
                            .offset(x: 20, y: 16)

                        Image("SPBack")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .offset(x: 155, y: 38)

                        Image("Plan2char")
                            .resizable()
                            .frame(width: 130, height: 130)
                            .offset(x: 213, y: -12)
                    }
                    .frame(width: 354, height: 137)
                    .padding(.horizontal, 18)

                    Spacer()

                    // MARK: - 버튼
                    HStack(spacing: 10) {

                        Button {
                            highlightPrev = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                highlightPrev = false
                                goNext = true
                            }
                        } label: {
                            Text("이전")
                                .font(.pretendard(.semiBold, size: 18))
                                .foregroundColor(.white)
                                .frame(width: 172, height: 60)
                                .background(
                                    highlightPrev
                                    ? Color(red: 0.4, green: 0.42, blue: 1)
                                    : Color(red: 0.12, green: 0.12, blue: 0.27)
                                )
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .inset(by: 0.5)
                                        .stroke(.white.opacity(0.12), lineWidth: 1)
                                )
                        }

                        Button {
                            highlightNext = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                highlightNext = false
                                goNext = true
                            }
                        } label: {
                            Text("다음")
                                .font(.pretendard(.semiBold, size: 18))
                                .foregroundColor(.white)
                                .frame(width: 172, height: 60)
                                .background(
                                    highlightNext
                                    ? Color(red: 0.4, green: 0.42, blue: 1)
                                    : Color(red: 0.12, green: 0.12, blue: 0.27)
                                )
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .inset(by: 0.5)
                                        .stroke(.white.opacity(0.12), lineWidth: 1)
                                )
                        }
                    }
                    .padding(.horizontal, 18)
                    .padding(.bottom, 42)
                }
                .frame(width: 390, height: 844)
                .navigationDestination(isPresented: $goNext) {
                    NextScheduleView()
                }
            }
        }
    }
}

struct NextScheduleView: View {
    var body: some View {
        Text("다음 화면")
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
    }
}

#Preview {
    SchedulPlus1()
}
