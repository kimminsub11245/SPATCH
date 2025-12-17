import SwiftUI

struct Schedulpopup: View {
    @Binding var isPresented: Bool
    let onConfirmExit: () -> Void   // ✅ 네, 나갈게요 콜백

    @State private var isNoTapped = false
    @State private var isYesTapped = false

    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
                .ignoresSafeArea()

            ZStack {
                // 팝업 배경
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(red: 0.16, green: 0.17, blue: 0.19))
                    .frame(width: 336, height: 244)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .inset(by: 0.5)
                            .stroke(
                                Color(red: 0.25, green: 0.26, blue: 0.3),
                                lineWidth: 1
                            )
                    )

                VStack(spacing: 0) {

                    // MARK: - 상단 아이콘
                    ZStack {
                        Image("round")
                            .resizable()
                            .frame(width: 52, height: 52)
                            .background(Color(red: 0.27, green: 0.27, blue: 0.29))
                            .clipShape(Circle())
                            .padding(.top, 32)

                        Image("popup12")
                            .resizable()
                            .frame(width: 6, height: 28)
                            .offset(y: 15)
                    }

                    // MARK: - 타이틀
                    Text("생성하지 않고 나가시겠습니까?")
                        .font(.pretendard(.semiBold, size: 20))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 253)
                        .padding(.top, 14)

                    // MARK: - 서브 텍스트
                    Text("작성 중인 내용이 사라집니다.")
                        .font(.pretendard(.regular, size: 16))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.7))
                        .frame(width: 253)
                        .padding(.top, 4)

                    Spacer()

                    // MARK: - 버튼 영역
                    HStack(spacing: 8) {

                        // ❌ 아니요
                        Button {
                            isNoTapped = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                isNoTapped = false
                                isPresented = false   // ✅ 팝업만 닫기
                            }
                        } label: {
                            Text("아니요")
                                .font(.pretendard(.semiBold, size: 16))
                                .foregroundColor(Color.white.opacity(0.76))
                                .frame(width: 145, height: 49)
                                .background(
                                    isNoTapped
                                    ? Color(red: 0.4, green: 0.42, blue: 1)
                                    : Color(red: 0.11, green: 0.11, blue: 0.13)
                                )
                                .cornerRadius(8)
                        }

                        // ✅ 네, 나갈게요
                        Button {
                            isYesTapped = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                isYesTapped = false
                                isPresented = false
                                onConfirmExit()   // ✅ 부모에게 이동 요청
                            }
                        } label: {
                            Text("네, 나갈게요")
                                .font(.pretendard(.semiBold, size: 16))
                                .foregroundColor(Color.white.opacity(0.76))
                                .frame(width: 145, height: 49)
                                .background(
                                    isYesTapped
                                    ? Color(red: 0.4, green: 0.42, blue: 1)
                                    : Color(red: 0.11, green: 0.11, blue: 0.13)
                                )
                                .cornerRadius(8)
                        }
                    }
                    .padding(.bottom, 19)
                }
                .frame(width: 336, height: 244)
            }
        }
    }
}

#Preview {
    Schedulpopup(
        isPresented: .constant(true),
        onConfirmExit: {
            // Preview용이라 비워도 됨
            print("Preview exit")
        }
    )
}
