import SwiftUI

struct ProvinceCity: Identifiable {
    var id: String { name }
    let name: String
    let cities: [String]
}

struct SchedulPlus2: View {
    @State private var highlightPrev = false
    @State private var highlightNext = false
    @State private var goNext = false
    @State private var searchText: String = ""

    @State private var selectedProvince: String = "인기"
    @State private var selectedCity: String? = nil

    // 🔹 팝업 상태
    @State private var showPopup = false

    // 🔹 뒤로가기 dismiss
    @Environment(\.dismiss) private var dismiss

    let provinces: [ProvinceCity] = [
        ProvinceCity(name: "인기", cities: ["강남구", "해운대구", "동대문구", "서초구", "서구"]),
        ProvinceCity(name: "서울특별시", cities: ["강남구", "종로구", "서초구", "마포구", "강서구"]),
        ProvinceCity(name: "경기도", cities: ["수원", "성남", "의정부", "안양", "부천", "광명", "평택", "고양", "파주", "남양주"]),
        ProvinceCity(name: "강원도", cities: ["춘천", "강릉", "원주", "속초", "동해"]),
        ProvinceCity(name: "충청남도", cities: ["천안", "아산", "공주", "보령"]),
        ProvinceCity(name: "충청북도", cities: ["청주", "충주", "제천"]),
        ProvinceCity(name: "경상남도", cities: ["창원", "진주", "김해", "양산"]),
        ProvinceCity(name: "경상북도", cities: ["포항", "경주", "구미", "안동"]),
        ProvinceCity(name: "전라남도", cities: ["여수", "순천", "목포", "광양"]),
        ProvinceCity(name: "전라북도", cities: ["전주", "익산", "군산"]),
        ProvinceCity(name: "제주특별자치도", cities: ["제주시", "서귀포시"]),
        ProvinceCity(name: "인천광역시", cities: ["연수구", "부평구", "계양구", "중구"]),
        ProvinceCity(name: "대구광역시", cities: ["중구", "달서구", "수성구"]),
        ProvinceCity(name: "부산광역시", cities: ["해운대구", "수영구", "동래구"]),
        ProvinceCity(name: "울산광역시", cities: ["중구", "남구", "북구"]),
        ProvinceCity(name: "세종특별자치시", cities: ["세종시"]),
        ProvinceCity(name: "광주광역시", cities: ["동구", "서구", "남구"])
    ]

    var filteredCities: [String] {
        let cities = provinces.first(where: { $0.name == selectedProvince })?.cities ?? []
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return cities
        } else {
            return cities.filter { $0.contains(searchText) }
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack(spacing: 0) {

                    // MARK: - 상단바
                    Spacer().frame(height: 50)

                    ZStack {
                        Text("지역 등록")
                            .font(.pretendard(.semiBold, size: 18))
                            .foregroundColor(.white)

                        HStack {
                            Image("SBack")
                                .resizable()
                                .frame(width: 7.5, height: 15)
                                .padding(.leading, 21.25)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    showPopup = true
                                }
                            Spacer()
                        }
                    }
                    .frame(height: 50)

                    // MARK: - 타이틀
                    Spacer().frame(height: 24)

                    Text("원하는 지역을 선택해주세요.")
                        .font(.pretendard(.regular, size: 14))
                        .foregroundColor(.white.opacity(0.76))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 18)

                    Spacer().frame(height: 6)

                    Text("어떤 지역을\n탐사할 계획이신가요?")
                        .font(.paperlogy(.medium, size: 26))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 18)

                    // MARK: - 검색
                    Spacer().frame(height: 24)

                    HStack {
                        TextField("지역 검색", text: $searchText)
                            .font(.pretendard(.light, size: 16))
                            .foregroundColor(.white.opacity(0.7))
                            .accentColor(.white)

                        Spacer()

                        Image("Ssearch")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 12)
                    .background(Color(red: 0.11, green: 0.11, blue: 0.13))
                    .cornerRadius(6)
                    .padding(.horizontal, 18)

                    // MARK: - 도 선택
                    Spacer().frame(height: 24)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(provinces) { province in
                                Text(province.name)
                                    .font(.pretendard(.medium, size: 14))
                                    .foregroundColor(
                                        selectedProvince == province.name
                                        ? .white
                                        : .white.opacity(0.6)
                                    )
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        selectedProvince == province.name
                                        ? Color(red: 0.4, green: 0.42, blue: 1)
                                        : Color(red: 0.11, green: 0.11, blue: 0.13)
                                    )
                                    .cornerRadius(100)
                                    .onTapGesture {
                                        selectedProvince = province.name
                                        selectedCity = nil
                                    }
                            }
                        }
                        .padding(.horizontal, 18)
                    }

                    // MARK: - 결과 영역
                    Spacer().frame(height: 20)

                    ScrollView {
                        if filteredCities.isEmpty {
                            VStack(spacing: 20) {
                                Image("NODATE")
                                    .resizable()
                                    .frame(width: 39, height: 39)

                                Text("검색 결과가 없습니다")
                                    .font(.pretendard(.medium, size: 16))
                                    .foregroundColor(.white.opacity(0.7))
                            }
                            .frame(width: 354)
                            .padding(.top, 126.5)
                        } else {
                            VStack(spacing: 10) {
                                ForEach(filteredCities, id: \.self) { city in
                                    HStack {
                                        Text(city)
                                            .font(.pretendard(.medium, size: 16))
                                            .foregroundColor(
                                                selectedCity == city
                                                ? .white
                                                : .white.opacity(0.76)
                                            )

                                        Spacer()

                                        Image(selectedCity == city ? "select" : "Noselect")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                    }
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 11)
                                    .overlay(
                                        selectedCity == city
                                        ? RoundedRectangle(cornerRadius: 12)
                                            .stroke(.white, lineWidth: 0.8)
                                        : nil
                                    )
                                    .onTapGesture {
                                        selectedCity = city
                                    }
                                }
                            }
                            .frame(width: 354)
                        }
                    }

                    Spacer()

                    // MARK: - 버튼
                    HStack(spacing: 10) {
                        Button {
                            highlightPrev = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                highlightPrev = false
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
                        }
                    }
                    .padding(.horizontal, 18)
                    .padding(.bottom, 42)
                }
                .frame(width: 390, height: 844)

                // MARK: - 팝업
                if showPopup {
                    Schedulpopup(
                        isPresented: $showPopup,
                        onConfirmExit: {
                            dismiss()
                        }
                    )
                }
            }
        }
    }
}

#Preview {
    SchedulPlus2()
}
