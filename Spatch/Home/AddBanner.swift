import SwiftUI

struct AddBanner: View {
    var body: some View {
        ZStack(alignment: .top) {

            // 배경 이미지 (image 1090)
            Image("image 1090")
                .resizable()
                .scaledToFill()
                .frame(width: 354, height: 105)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

            // 상단에 겹쳐지는 이미지 (image 1092)
            Image("image 1092")
                .resizable()
                .frame(width: 350, height: 88)
                .offset(y: 10) // 상단에서부터 38pt 올라오게 조정 (겹치기)
        }
        .frame(width: 354, height: 105) // 전체 영역은 배경 이미지 크기에 맞춤
        .padding(.top, 60) // 필요시 상단 간격 조절
    }
}

#Preview {
    AddBanner()
}
