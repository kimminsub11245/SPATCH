
import SwiftUI

struct Word: View {
    var body: some View {
        HStack(alignment: .center) {
            Text("지금 핫한 탐험가들의 탐사기록")
                .font(.pretendard(.semiBold, size: 18))
                .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95))

            Spacer()

            HStack(spacing: 4) {
                Text("더보기")
                    .font(.pretendard(.regular, size: 14))
                    .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95).opacity(0.7))

                Image("Group 44")
                    .resizable()
                    .frame(width: 10, height: 10)
            }
        }
        .padding(.horizontal, 0)
        .frame(width: 354, alignment: .center)
    }
}

#Preview {
    Word()
        .background(Color.black)
}
