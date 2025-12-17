import SwiftUI

struct SchedulPlus3: View {

    // MARK: - State
    @State private var showPopup = false

    // 현재 선택된 월 (초기값: 2025년 8월)
    @State private var currentDate: Date = {
        var c = DateComponents()
        c.year = 2025
        c.month = 8
        c.day = 1
        return Calendar.current.date(from: c)!
    }()

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack(spacing: 0) {

                    // MARK: - 상단바 (SafeArea 직접 제어)
                    Spacer().frame(height: 50)

                    ZStack {
                        Text("일자 등록")
                            .font(.pretendard(.semiBold, size: 18))
                            .foregroundColor(.white)

                        HStack {
                            Image("SBack")
                                .resizable()
                                .frame(width: 7.5, height: 15)
                                .padding(.leading, 21.25)
                                .contentShape(Rectangle())
                                .onTapGesture { showPopup = true }
                            Spacer()
                        }
                    }
                    .frame(height: 50)

                    // MARK: - 타이틀
                    Spacer().frame(height: 24)

                    Text("원하는 일자를 선택해주세요.")
                        .font(.pretendard(.regular, size: 14))
                        .foregroundColor(.white.opacity(0.76))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 18)

                    Spacer().frame(height: 6)

                    Text("탐사 일자를\n스팟치와 정해봐요!")
                        .font(.paperlogy(.medium, size: 26))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 18)

                    // MARK: - 월 헤더
                    Spacer().frame(height: 33)

                    ZStack {
                        HStack {
                            Image("Lcback")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 10, height: 45)
                                .padding(.leading, 33)
                                .onTapGesture { changeMonth(-1) }

                            Spacer()

                            Image("LCright")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 10, height: 45)
                                .padding(.trailing, 34)
                                .onTapGesture { changeMonth(1) }
                        }

                        HStack(spacing: 7) {
                            Text(monthTitle)
                                .font(.paperlogy(.medium, size: 20))
                                .foregroundColor(.white)

                            Image("LCdown")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 10)
                        }
                    }

                    // MARK: - 요일 (고정)
                    Spacer().frame(height: 38)

                    HStack(spacing: 23) {
                        dayView("일", color: Color(red: 0.93, green: 0.25, blue: 0.36))
                        dayView("월")
                        dayView("화")
                        dayView("수")
                        dayView("목")
                        dayView("금")
                        dayView("토", color: Color(red: 0.28, green: 0.43, blue: 1))
                    }

                    // MARK: - 날짜 그리드 (요일 기준 자동 정렬)
                    Spacer().frame(height: 24)

                    VStack(spacing: 24) {
                        ForEach(calendarDays, id: \.self) { week in
                            HStack(spacing: 23) {
                                ForEach(week) { day in
                                    dateCell(
                                        String(format: "%02d", day.day),
                                        isDisabled: !day.isCurrentMonth
                                    )
                                }
                            }
                        }
                    }

                    Spacer()
                }

                // MARK: - 이탈 확인 팝업
                if showPopup {
                    Schedulpopup(
                        isPresented: $showPopup,
                        onConfirmExit: { dismiss() }
                    )
                }
            }
            .ignoresSafeArea(.container, edges: .top) // 🔑 상단 밀림 방지
        }
    }

    // MARK: - 월 변경
    private func changeMonth(_ value: Int) {
        if let newDate = Calendar.current.date(byAdding: .month, value: value, to: currentDate) {
            currentDate = newDate
        }
    }

    // MARK: - 월 텍스트
    private var monthTitle: String {
        let c = Calendar.current.dateComponents([.year, .month], from: currentDate)
        return "\(c.year!)년 \(c.month!)월"
    }

    // MARK: - 날짜 모델
    private struct CalendarDay: Identifiable, Hashable {
        let id = UUID()
        let day: Int
        let isCurrentMonth: Bool
    }

    // MARK: - 날짜 계산 (요일 기준 / 7×5 고정)
    private var calendarDays: [[CalendarDay]] {
        let calendar = Calendar.current

        let startOfMonth = calendar.date(
            from: calendar.dateComponents([.year, .month], from: currentDate)
        )!

        let daysInMonth = calendar.range(of: .day, in: .month, for: currentDate)!.count
        let firstWeekday = calendar.component(.weekday, from: startOfMonth) // 1 = 일

        var days: [CalendarDay] = []

        // 전달 날짜
        let prevMonth = calendar.date(byAdding: .month, value: -1, to: currentDate)!
        let prevDays = calendar.range(of: .day, in: .month, for: prevMonth)!.count
        let leading = firstWeekday - 1

        if leading > 0 {
            for day in (prevDays - leading + 1)...prevDays {
                days.append(CalendarDay(day: day, isCurrentMonth: false))
            }
        }

        // 현재 달
        for day in 1...daysInMonth {
            days.append(CalendarDay(day: day, isCurrentMonth: true))
        }

        // 다음 달
        var nextDay = 1
        while days.count < 35 {
            days.append(CalendarDay(day: nextDay, isCurrentMonth: false))
            nextDay += 1
        }

        return stride(from: 0, to: 35, by: 7).map {
            Array(days[$0..<$0 + 7])
        }
    }

    // MARK: - 요일 셀
    private func dayView(_ text: String, color: Color = .white) -> some View {
        Text(text)
            .font(.paperlogy(.medium, size: 14))
            .foregroundColor(color)
            .frame(width: 30, height: 30)
    }

    // MARK: - 날짜 셀 (선택 로직 없음)
    private func dateCell(_ text: String, isDisabled: Bool) -> some View {
        Text(text)
            .font(.paperlogy(.medium, size: 13))
            .foregroundColor(
                isDisabled
                ? Color.white.opacity(0.4)
                : Color.white
            )
            .frame(width: 30, height: 30)
    }
}

#Preview {
    SchedulPlus3()
}
